import 'package:flutter_base_project/features/landing/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';


class AuthRoute {
  AuthRoute._();

  //**Auth Routes */
  static const String auth = '/auth';

  /// Auth Router
  static final route = GoRoute(
    name: auth,
    path: '/auth',
    builder: (context, state) => const SplashScreen(),
    routes: [
      
    ],
  );
}
