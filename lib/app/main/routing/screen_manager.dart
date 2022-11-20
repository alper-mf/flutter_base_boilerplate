import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../features/home/home_screen.dart';
import 'page_navigation.dart';
part 'app_screens.dart';

class Screens with PageNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Screens? _screens;
  // ignore: library_private_types_in_public_api
  late final _AppScreen main;

  Screens._() {
    main = _AppScreen();
  }

  static Screens get instance {
    _screens ??= Screens._();

    return _screens!;
  }

  static BuildContext get context => _screens!.navigatorKey.currentContext!;

  restartApp() async {
    // await Get.deleteAll();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(main.init, (route) => false);
  }
}
