import 'package:flutter/material.dart';

///__connectionStatus__ : [ConnectionStatusEnum] tipinde bağlantı durumunu verir.
///
///__connectionDelay__ : Sunucuya atılan istek ve dönen cevap arasındaki süreyi verir.
///
///__isWebSocket__ : Atılan isteğin api ya da webSocket olmadığına karar verilir.
class ConnectionStatusModel {
  final bool? isWebSocket;
  final ConnectionStatusEnum? connectionStatus;
  final int? connectionDelay;
  final Color? color;
  final String? title;

  ConnectionStatusModel({
    this.isWebSocket,
    this.connectionStatus,
    this.connectionDelay,
    this.color,
    this.title,
  });
}

enum ConnectionStatusEnum { ok, normal, slow, error }
