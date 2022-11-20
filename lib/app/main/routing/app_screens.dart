part of './screen_manager.dart';

class _AppScreen with PageNavigation {
  final String init = '/';
  final String homeScreen = _getMainScreenName('homeScreen');

  Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    if (setting.name == init) {
      return goToPage(const HomeScreen(), setting);
    } else {
      return returnUnknownPageRoute(setting);
    }
  }
}

String _getMainScreenName(String screenName) {
  var value = '/$screenName';
  log(value, name: 'received_return_request_screen Name In Route');

  return value;
}
