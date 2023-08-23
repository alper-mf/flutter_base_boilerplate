import 'package:go_router/go_router.dart';
import '../../../../features/auth/sign_in/sign_in_screen.dart';
import '../../../../features/auth/sign_up/sign_up_screen.dart';

class AuthRoute {
  AuthRoute._();

  //**Auth Routes */
  static const String auth = '/auth';
  static const String signIn = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyEmail = '/auth/verify-email';
  static const String resetPassword = '/auth/reset-password';
  static const String otp = '/auth/otp';

  /// Auth Router
  static final route = GoRoute(
    name: auth,
    path: '/auth',
    builder: (context, state) => const SignInScreen(),
    routes: [
      GoRoute(
        name: signIn,
        path: 'sign_in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: signUp,
        path: 'sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
