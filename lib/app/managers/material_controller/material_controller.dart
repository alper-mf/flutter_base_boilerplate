import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../main/values/enums/cache_key.dart';
import '../../main/values/enums/general_enum.dart';
import '../locale_manager/locale_manager.dart';
import 'material_controller_model.dart';

class MaterialAppController {
  MaterialAppController._();
  static final _instance = MaterialAppController._();
  static MaterialAppController get instance => _instance;
  late MaterialControllerModel model;

  late ThemeData darkTheme;
  late ThemeData lightTheme;

  ///Locale Manager Service
  final LocaleManager localeManager = LocaleManager.instance;

  //Stream Behavior
  late final BehaviorSubject<MaterialControllerModel> _model = BehaviorSubject.seeded(initialData());

  //Stream
  Stream<MaterialControllerModel> get outModel => _model;

  void initTheme(ThemeData outDarkTheme, ThemeData outLightTheme) {
    darkTheme = outDarkTheme;
    lightTheme = outLightTheme;
  }

  ThemeData _initTheme() {
    final cache = localeManager.getStringValue(CacheKey.theme);
    if (cache == null) {
      bool isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      final theme = isPlatformDark ? darkTheme : lightTheme;

      return theme;
    } else {
      final theme = cache == ThemeModeEnum.dark.name ? lightTheme : darkTheme;

      return theme;
    }
  }

  /// cache te dil ayarları varsa çeker yoksa [kDefaultLocal] değerini alır
  Locale get _getDefaultKeyFromCache {
    final lan = Locale(localeManager.getStringValue(CacheKey.languageCode) ?? 'en');

    return lan;
  }

  ///Initial data for materialController
  MaterialControllerModel initialData() {
    model = MaterialControllerModel(locale: _getDefaultKeyFromCache, themeData: _initTheme());

    return model;
  }

  ///Set Theme Function.
  void setTheme(BuildContext context) {
    bool isPlatformDark = Theme.of(context).brightness != Brightness.light ? true : false;
    final theme = isPlatformDark ? lightTheme : darkTheme;
    localeManager.setStringValue(CacheKey.theme, isPlatformDark ? ThemeModeEnum.dark.name : ThemeModeEnum.light.name);
    _model.add(model.copyWith(themeData: theme));
  }

  ///Set localization code function
  void setLocale(
    BuildContext context,
    String lanCode,
  ) {
    bool isPlatformDark = Theme.of(context).brightness == Brightness.light ? true : false;
    final theme = isPlatformDark ? lightTheme : darkTheme;
    localeManager.setStringValue(CacheKey.languageCode, lanCode);
    _model.add(
      model.copyWith(locale: Locale(lanCode), themeData: theme),
    );
  }
}
