import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../notification/local_notification_handler.dart';

class FirebaseMessagingService {

  FirebaseMessagingService._init() {
    messaging = FirebaseMessaging.instance;
  }
  late final FirebaseMessaging messaging;
  static FirebaseMessagingService? _instance;

  static FirebaseMessagingService get instance {
    _instance ??= FirebaseMessagingService._init();
    return _instance!;
  }

  Future<void> listenToNotification() async {
    await messaging.requestPermission(
      
    );
    unawaited(_postFCMToken());
    FirebaseMessaging.onMessage.listen(_showNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {});
    // FirebaseMessaging.onBackgroundMessage(_showNotification);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    if (message.notification != null) {
      LocalNotificationHandler.instance.showNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body,
      );
    }
  }

  Future<String?> _postFCMToken() async {
    try {
      final String? token = await messaging.getToken();
      return token;
    } catch (e) {
      return null;
    }
  }
}
