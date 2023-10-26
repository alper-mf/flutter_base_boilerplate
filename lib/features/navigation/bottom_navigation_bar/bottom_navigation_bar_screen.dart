import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import 'package:get/get.dart';

import 'controller/bottom_navigation_controller.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavigationController(),
      builder: (_) => BottomNavigationBarView(child: child),
    );
  }
}
