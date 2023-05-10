import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/home/home_screen.dart';
import 'package:flutter_base_project/features/test/common/test_model.dart';
import 'package:flutter_base_project/features/test/seconde_test_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../features/test/first_test_screen.dart';

class Screens {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Screens._privateConstructor();

  static final Screens _instance = Screens._privateConstructor();
  static Screens get instance => _instance;

  /// Get the current context
  BuildContext? get context => navigatorKey.currentContext;

  //**Screen Paths */
  static const String homeScreenPath = '/';
  static const String firstTestScreenPath = '/firstTestScreen';
  static const String secondTestScreenPath = '/secondTestScreen';

  //**Screen Routes */
  final _router = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: homeScreenPath,
          path: homeScreenPath,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: firstTestScreenPath,
          path: firstTestScreenPath,
          builder: (context, state) {
            final testModel = TestModel.fromJson(state.extra as Map<String, dynamic>);
            return FirstTestScreen(testModel: testModel);
          },
        ),
        GoRoute(
          name: secondTestScreenPath,
          path: '$secondTestScreenPath/:userId',
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
