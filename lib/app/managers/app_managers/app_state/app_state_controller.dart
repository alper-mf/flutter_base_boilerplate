import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/theme/theme.dart';
import 'package:flutter_base_project/app/main/theme/themes/app_dark_theme.dart';
import 'package:flutter_base_project/app/main/theme/themes/app_light_theme.dart';
import 'package:rxdart/rxdart.dart';

import '../../../main/values/enum/cache_key_enum.dart';
import '../../../main/values/enum/general_enum.dart';
import '../../locale_manager/locale_manager.dart';
import 'app_state_model.dart';


class AppStateController {
  AppStateController._();
  static final AppStateController _instance = AppStateController._();
  static AppStateController get instance => _instance;
  late AppStateModel model;

  ThemeData darkTheme=getTheme(AppDarkTheme());
  ThemeData lightTheme=getTheme(AppLightTheme());

  ///Locale Manager Service
  final LocaleManager localeManager = LocaleManager.instance;

  //Stream Behavior
  late final BehaviorSubject<AppStateModel> _model = BehaviorSubject.seeded(initialData());

  //Stream
  Stream<AppStateModel> get outModel => _model;


  ThemeData _initTheme() {
    final String? cache = localeManager.getStringValue(CacheKey.theme);
    if (cache == null) {
      final bool isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      final ThemeData theme = isPlatformDark ? darkTheme : lightTheme;

      return theme;
    } else {
      final ThemeData theme = cache == ThemeModeEnum.dark.name ? darkTheme : lightTheme;

      return theme;
    }
  }

  /// cache te dil ayarları varsa çeker yoksa [kDefaultLocal] değerini alır
  Locale get _getDefaultKeyFromCache {
    final Locale lan = Locale(localeManager.getStringValue(CacheKey.languageCode) ?? 'en');

    return lan;
  }

  ///Initial data for materialController
  AppStateModel initialData() {
    model = AppStateModel(locale: _getDefaultKeyFromCache, themeData: _initTheme());

    return model;
  }

  ///Set Theme Function.
  void setTheme(BuildContext context) {
    final bool isPlatformDark = Theme.of(context).brightness != Brightness.light ? true : false;
    final ThemeData theme = isPlatformDark ? lightTheme : darkTheme;
    localeManager.setStringValue(CacheKey.theme, isPlatformDark ? ThemeModeEnum.dark.name : ThemeModeEnum.light.name);
    _model.add(model.copyWith(themeData: theme));
  }

  ///Set localization code function
  void setLocale(
    BuildContext context,
    String lanCode,
  ) {
    final bool isPlatformDark = Theme.of(context).brightness == Brightness.light ? true : false;
    final ThemeData theme = isPlatformDark ? lightTheme : darkTheme;
    localeManager.setStringValue(CacheKey.languageCode, lanCode);
    _model.add(
      model.copyWith(locale: Locale(lanCode), themeData: theme),
    );
  }
}
