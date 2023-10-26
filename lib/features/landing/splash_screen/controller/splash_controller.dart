import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/common/base_view/controller/base_controller.dart';
import 'package:flutter_base_project/app/common/exception/app_exception.dart';
import 'package:flutter_base_project/app/managers/connection_manager/connection_manager.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/managers/notification/local_notification_handler.dart';
import '../../../../app/main/i10n/i10n.dart';
import '../../../../app/managers/session_manager/session_manager.dart';

class SplashController extends BaseControllerInterface {
  

  @override
  void onInit() {
    super.onInit();
    init();
  }


  @override
  void onReady() {
    onReadyGeneric(()async{
      await ready();
    });
  }

  void init() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );

    /// telefonu çevirdiğimiz de sayfanın rotate olmaması için eklendi.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> ready() async {
  
    await Get.deleteAll();
    LocalNotificationHandler.instance;
    Get.put(SessionManager());

    bool isInternetAvaible = await ConnectionManager.instance.isInternetAvaible();
    

    if (!isInternetAvaible) {
      throw AppException(AppLocalization.getLabels.noInternetErrorMessage);
    }

      await Future.delayed(Duration(seconds: 2));

      // await Firebase.initializeApp();
      // FirebaseMessagingService.instance.listenToNotification();

      context.go('/1st');      
    } 
}
