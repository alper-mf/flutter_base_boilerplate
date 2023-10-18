import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/auth_route.dart';
import 'package:flutter_base_project/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

class Screens {
  Screens._privateConstructor();

  static final Screens _instance = Screens._privateConstructor();
  static Screens get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Get the current context
  BuildContext? get context => navigatorKey.currentContext;

  final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: navigatorKey,
    redirectLimit: 1,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      AuthRoute.route,
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const ErrorPage(),
    ),
  );

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
