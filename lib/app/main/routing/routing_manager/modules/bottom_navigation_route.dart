import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'package:flutter_base_project/features/navigation/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:go_router/go_router.dart';



class BottomNavigationRoute {
  BottomNavigationRoute._();

  static final route = ShellRoute(
      navigatorKey: RoutingManager.shellKey,
      
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
            child: BottomNavigationBarScreen(
          child: child,
        ));
      },
      routes: [
        GoRoute(
          path: '/1st',
          parentNavigatorKey: RoutingManager.shellKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Center(child: Text('1st')),
            );
          },
        ),
        GoRoute(
          path: '/2nd',
          parentNavigatorKey: RoutingManager.shellKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Center(child: Text('2nd')),
            );
          },
        ),
        GoRoute(
            parentNavigatorKey: RoutingManager.shellKey,
            path: '/3rd',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Center(child: Text('3rd')),
              );
            }),
        GoRoute(
            parentNavigatorKey: RoutingManager.shellKey,
            path: '/4th',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Center(child: Text('4th')),
              );
            }),
      ],
    );
}
