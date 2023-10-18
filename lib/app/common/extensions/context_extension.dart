import 'dart:io';
import 'package:flutter/material.dart' show BuildContext;

extension CheckInternetExtension on BuildContext {
  Future<bool> isInternetAvaible() async {
    try {
      const String checkInternetURL = 'google.com';
      final result = await InternetAddress.lookup(checkInternetURL);
      final isActive = result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;

      return isActive;
    } on SocketException catch (_) {

      return false;
    }
  }
}
