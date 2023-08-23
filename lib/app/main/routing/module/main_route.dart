class MainRoute {
  MainRoute._();

  static const String home = '/';
  static const String explore = '/explore';
  static const String settings = '/settings';
  static const String messages = '/messages';
  static String chatDetail(String chatId) => '/messages/$chatId';
  static const String search = '/search';
  static const String profile = '/profile';
}
