import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/modules/bottom_navigation_route.dart';
import 'package:flutter_base_project/features/navigation/unknown_route_screen/unknown_route_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/landing/splash_screen/splash_screen.dart';
import '../history_observer/navigation_history_observer.dart';
import 'modules/auth_route.dart';

class RoutingManager {
  RoutingManager._privateConstructor();

  static final RoutingManager _instance = RoutingManager._privateConstructor();
  static RoutingManager get instance => _instance;

  static final GlobalKey<NavigatorState> parentKey = GlobalKey();
  static final GlobalKey<NavigatorState> shellKey = GlobalKey();

  /// Get the current context
  BuildContext?  get context => parentKey.currentContext;

  final _router = GoRouter( 
    observers: [NavigationHistoryObserver()],
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: parentKey,
    redirectLimit: 1,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      AuthRoute.route,
      BottomNavigationRoute.route,
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const UnknownRouteScreen(),
    ),
  );

  GoRouter get router => _router;

  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  RouteInformationParser<Object> get routeInformationParser => _router.routeInformationParser;
}