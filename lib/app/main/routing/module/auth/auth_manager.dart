import 'package:flutter/foundation.dart';
import 'package:flutter_base_project/app/main/routing/module/auth/model/auth_model.dart';
import 'package:flutter_base_project/app/main/values/enums/cache_key.dart';

import '../../../../managers/locale_manager/locale_manager.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthManager extends ChangeNotifier {
  final LocaleManager localeManager = LocaleManager.instance;

  AuthStatus _authStatus = AuthStatus.unauthenticated;
  String _token = '';

  //**Getters and Setters**//
  AuthStatus get authStatus => _authStatus;
  String get token => _token;

  Future<void> signIn(
    AuthModel model,
  ) async {
    if (model.token != null) {
      _token = model.token!;
      await localeManager.setStringValue(CacheKey.token, token);
    }
    _authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<void> signOut() async {
    _token = '';
    await localeManager.clearAll();
    _authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
