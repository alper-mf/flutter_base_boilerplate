import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class FirebaseDeeplinkService {

  FirebaseDeeplinkService._();
  static FirebaseDeeplinkService? _instance;

  static FirebaseDeeplinkService get instance {
    _instance ??= FirebaseDeeplinkService._();
    return _instance!;
  }

  Future<void> getAndListenToDynamicLink() async {
    try {
      final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

      ///Implement deeplink logic here

    } catch (e) {
      debugPrint('getAndListenToDynamicLink Error');
    }
  }
}
