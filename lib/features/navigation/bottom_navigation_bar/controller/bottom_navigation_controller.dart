import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/base_view/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationController extends BaseControllerInterface {


Rx<int> _selectedIndex = Rx(0);

int get selectedIndex => _selectedIndex.value;
set selectedIndex(int value)=>_selectedIndex.value=value;


List<MyCustomBottomNavBarItem> get tabs => [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: '1st',
      initialLocation: '/1st',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.explore_outlined),
      activeIcon: Icon(Icons.explore),
      label: '2nd',
      initialLocation: '/2nd',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.storefront_outlined),
      activeIcon: Icon(Icons.storefront),
      label: '3rd',
      initialLocation: '/3rd',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: '/4th',
      initialLocation: '/4th',
    ),
  ];


  void onTapBottomBarItem(int index) {
    if (index == selectedIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;
    selectedIndex=index;
    router.go(location);
  }
}




class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}