import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'connection_status_model.dart';

class ConnectionService {
  ConnectionService._();
  static final _instance = ConnectionService._();
  static ConnectionService get instance => _instance;

  final _hasConnectionStreamController = StreamController<bool>();
  final _serverPingStreamController = StreamController<ConnectionStatusModel>();

  final Duration _lookUpConnectionDelay = const Duration(seconds: 10);
  // ignore: unused_field
  final Duration _lookUpWebSocketDelay = const Duration(seconds: 5);

  final String _checkInternetURL = 'google.com';
  // ignore: unused_field
  final String _webScoketURL = '';
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
/* 
  Future _webSocketPing() async {
    debugPrint('Socket T Başlatıldı');
    final IOWebSocketChannel webSocketChannel = IOWebSocketChannel.connect(_webScoketURL);

    Stopwatch stopwatch = Stopwatch()..start();

    webSocketChannel.stream.listen((event) async {
      debugPrint('Socket Data --> $event');
      _updateServerPingStreamController(createConnectionModel(stopwatch.elapsedMilliseconds, true));
    })
      ..onError((error) {
        debugPrint('HATA ALDI');
        stopwatch.stop();
        final ConnectionStatusModel model = ConnectionStatusModel(
          connectionDelay: stopwatch.elapsedMilliseconds,
          isWebSocket: true,
          connectionStatus: ConnectionStatusEnum.error,
        );
        _updateServerPingStreamController(model);
      })
      ..onDone(() => debugPrint('Bağlantı Tamamlandı'))
      ..onData((data) => debugPrint('DATA alındı.. $data'))
      ..cancel();
  } */

  ///This function prepares to the server connection delay
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
    // print('SUNUCUYA ISTEK ATILDI => ${DateTime.now().minute}:${DateTime.now().second}');
  }

  ///Belirtilen süre için internet bağlantısını kontrol eder.
  void init() {
    Timer.periodic(_lookUpConnectionDelay, (timer) => isInternetAvaible());
    Timer.periodic(_lookUpConnectionDelay, (timer) => _serverPing());
    // Timer.periodic(_lookUpWebSocketDelay, (timer) => _webSocketPing());
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
