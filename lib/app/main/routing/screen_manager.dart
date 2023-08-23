import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/routing/app_route_constants.dart';
import 'package:flutter_base_project/features/home/home_screen.dart';
import 'package:flutter_base_project/features/test/common/test_model.dart';
import 'package:flutter_base_project/features/test/seconde_test_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../features/test/first_test_screen.dart';

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
      initialLocation: AppRoutes.home,
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          name: AppRoutes.home,
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: AppRoutes.firstTestScreen,
          path: '/first_test_screen',
          builder: (context, state) {
            final testModel = state.extra as TestModel;
            return FirstTestScreen(testModel: testModel);
          },
        ),
        GoRoute(
          name: AppRoutes.secondTestScreen,
          path: '/second_test_screen/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId'];
            return SecondTestScreen(testId: userId!);
          },
        ),
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
