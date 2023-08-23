class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String explore = '/explore';
  static const String settings = '/settings';
  static const String messages = '/messages';
  static String chatDetail(String chatId) => '/messages/$chatId';
  static const String search = '/search';
  static const String profile = '/profile';

  //**Test Screen */
  static const String firstTestScreen = '/first-test-screen';
  static const String secondTestScreen = '/second-test-screen';
}
