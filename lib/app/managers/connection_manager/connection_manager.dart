import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'connection_status_model.dart';

class ConnectionManager {
  ConnectionManager._();
  static final _instance = ConnectionManager._();
  static ConnectionManager get instance => _instance;

  final _hasConnectionStreamController = StreamController<bool>();
  final _serverPingStreamController = StreamController<ConnectionStatusModel>();

  final Duration _lookUpConnectionDelay = const Duration(seconds: 10);
  


  final String _checkInternetURL = 'google.com';
  final String _serverPingURL = 'https://baseURL';

  ///Internet bağlantısı olup olmadığını kontrol eder.
  Future<bool> isInternetAvaible() async {
    try {
      final result = await InternetAddress.lookup(_checkInternetURL);
      final isActive = result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;
      _updateStreamController(isActive);

      return isActive;
    } on SocketException catch (_) {
      _updateStreamController(false);

      return false;
    }
  }

  ///It's updating the controller for stream
  _updateStreamController(bool result) {
    _hasConnectionStreamController.sink.add(result);
  }

  Stream<bool> getInternetAvailabilityStream() {
    return _hasConnectionStreamController.stream;
  }

  void _updateServerPingStreamController(ConnectionStatusModel model) {
    _serverPingStreamController.sink.add(model);
  }

  Stream<ConnectionStatusModel> serverPingStream() {
    return _serverPingStreamController.stream;
  }

  Future _serverPing() async {
    Stopwatch stopwatch = Stopwatch()..start();

    try {
      final response = await HttpClient().getUrl(Uri.parse(_serverPingURL)).then((value) => value.close());
      if (response.statusCode == HttpStatus.ok) {
        stopwatch.stop();
        createConnectionModel(stopwatch.elapsedMilliseconds, false);
        _updateServerPingStreamController(createConnectionModel(stopwatch.elapsedMilliseconds, false));
      }
    } catch (e) {
      final model = ConnectionStatusModel(
        color: Colors.red,
        connectionStatus: ConnectionStatusEnum.error,
        isWebSocket: false,
        title: 'Internet bağlantısı yok.',
      );
      _updateServerPingStreamController(model);
    }
  }

  void init() {
    Timer.periodic(_lookUpConnectionDelay, (timer) => isInternetAvaible());
    Timer.periodic(_lookUpConnectionDelay, (timer) => _serverPing());
  }

  ConnectionStatusModel createConnectionModel(int stopWatchValue, bool isWebSocket) {
    late final ConnectionStatusModel model;

    if (stopWatchValue > 400) {
      model = ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.slow,
        connectionDelay: stopWatchValue,
        color: Colors.red,
        title: "Your connection speed is bad.",
      );

      return model;
    } else if (stopWatchValue > 250 && stopWatchValue < 400) {
      model = ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.normal,
        connectionDelay: stopWatchValue,
        color: Colors.orange,
        title: "Your connection speed is normal.",
      );

      return model;
    } else if (stopWatchValue > 0 && stopWatchValue < 250) {
      model = ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.ok,
        connectionDelay: stopWatchValue,
        color: Colors.green,
        title: "Your connection speed is good.",
      );
    } else {
      model = ConnectionStatusModel(
        isWebSocket: isWebSocket,
      );
    }

    return model;
  }
}
