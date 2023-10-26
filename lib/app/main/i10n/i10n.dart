import 'package:flutter/cupertino.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'default_localization.dart';

class AppLocalization<T extends AppLocalizationLabel> {

  const AppLocalization._(this.locale, this.labels);
  final Locale locale;
  final T labels;

  static AppLocalizationLabel get getLabels {
    AppLocalization? localization = Localizations.of(RoutingManager.instance.context!, AppLocalization);
    localization ??= AppLocalization._(kDefaultLocal, supportedLocalization[kDefaultLocal.languageCode]!);
    return localization.labels;
  }

  static _AppLocalizationDelegate delegate = const _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalization.containsKey(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final AppLocalization<AppLocalizationLabel> localization = AppLocalization._(locale, supportedLocalization[locale.languageCode]!);
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
