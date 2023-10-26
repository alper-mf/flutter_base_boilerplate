import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';



class BottomNavigationBarView extends GetView<BottomNavigationController> {
  const BottomNavigationBarView({super.key,required this.child, });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,

      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: controller.onTapBottomBarItem,
        currentIndex: controller.selectedIndex,
        items: controller.tabs,
      ),
    );
  }
}