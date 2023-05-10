import 'package:flutter/material.dart';

import '../routing/screen_manager.dart';
import 'default_localization.dart';

class AppLocalization<T extends AppLocalizationLabel> {
  final Locale locale;
  final T labels;

  const AppLocalization(this.locale, this.labels);

  static AppLocalizationLabel get getLabels {
    AppLocalization? localization = Localizations.of(Screens.instance.context!, AppLocalization);

    localization ??= AppLocalization(kDefaultLocal, supportedLocalization[kDefaultLocal.languageCode]!);

    return localization.labels;
  }

  // ignore: library_private_types_in_public_api
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
    final localization = AppLocalization(locale, supportedLocalization[locale.languageCode]!);

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
