import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/module/auth_route.dart';
import 'package:flutter_base_project/app/main/routing/module/test_route.dart';
import 'package:flutter_base_project/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class Screens {
  Screens._privateConstructor();

  static final Screens _instance = Screens._privateConstructor();
  static Screens get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Get the current context
  BuildContext? get context => navigatorKey.currentContext;

  //*Navigator Keys */

  //**Screen Paths */

  //**Screen Routes */
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
