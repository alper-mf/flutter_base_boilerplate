import 'package:flutter_base_project/app/data/response_models/user_info_model.dart';
import 'package:get/get.dart';

import '../../main/values/enum/cache_key_enum.dart';
import '../locale_manager/locale_manager.dart';


class SessionManager extends GetxController {
  final Rx<UserInfoModel> _currentUser = UserInfoModel().obs;
  final Rx<bool?> _loggedIn = Rx<bool?>(null);
  String? _token;

  UserInfoModel get currentUser => _currentUser.value;

  set currentUser(UserInfoModel value) {
    _currentUser.firstRebuild = true;
    _currentUser.value = value;
  }

  String? getUserToken() {
    _token ??= LocaleManager.instance.getStringValue(CacheKey.token);
    return _token;
  }

  Future<void> setUserToken(String value) async {
    await LocaleManager.instance.setStringValue(CacheKey.token, value);
    _token = value;
  }

  bool isUserLogin() {
    if (_loggedIn.value == null) {
      final bool value = LocaleManager.instance.getBoolValue(CacheKey.loggedIn) ?? false;
      _loggedIn.value = value;
    }
    return _loggedIn.value!;
  }

  Future<void> setLoggedIn(bool value) async {
    await LocaleManager.instance.setBoolValue(CacheKey.loggedIn, value);
    _loggedIn.value = value;
  }

  Future<void> logOut() async {
    await Future.wait([
      LocaleManager.instance.removeAt(CacheKey.token),
      setLoggedIn(false),
    ]);
    currentUser = UserInfoModel();
  }


  Future<void> logIn(GetUserInfoModel currentUser) async {
    currentUser = currentUser;
    await Future.wait([
      setLoggedIn(true),
      setUserToken(currentUser.token!),
    ]);
  }
}
