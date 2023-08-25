import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_manager.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_route.dart';
import 'package:flutter_base_project/app/main/routing/module/test/test_route.dart';
import 'package:flutter_base_project/features/home/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class Screens {
  Screens._privateConstructor();

  static final Screens _instance = Screens._privateConstructor();
  static Screens get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final authManager = AuthManager();

  /// Get the current context
  BuildContext? get context => navigatorKey.currentContext;

  final _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),

        ///Auth Routes
        AuthRoute.route,

        ///Test Routes
        ...TestRoute.route,
      ],
      errorPageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const ErrorPage(),
          ),

      ///Add authManager to refreshListenable to listen to auth changes
      refreshListenable: GetIt.I<AuthManager>(),
      redirect: (context, state) {
        ///Authentication controller can be used here to redirect to login screen
      });

  GoRouter get router => _router;

  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  RouteInformationParser<Object> get routeInformationParser => _router.routeInformationParser;
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Error Page')),
    );
  }
}
