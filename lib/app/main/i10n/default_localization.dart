import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Locale;

import '../values/enum/cache_key_enum.dart';
import '../../managers/locale_manager/locale_manager.dart';
import 'lan/en.dart';
import 'lan/tr.dart';

/// Default Locale ayarlarımız
const Locale kDefaultLocal = Locale('tr');

/// Ugulamanın desteklediği diler
const Map<String, AppLocalizationLabel> supportedLocalization = {
  'tr': TrLocalization(),
  'en': EnLocalization(),
};

List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (int index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );

/// cache te dil ayarları varsa çeker yoksa [kDefaultLocal] değerini alır
Locale get getDefaultKeyFromCache {
  try {
    String? lanCode = LocaleManager.instance.getStringValue(CacheKey.languageCode);
    if (lanCode != null) return Locale(lanCode);

    lanCode = Platform.localeName.split('_')[0];
    if (supportedLocalization.containsKey(lanCode) == true) return Locale(lanCode);

    return Locale(kDefaultLocal.languageCode);
  } catch (e) {
    return Locale(kDefaultLocal.languageCode);
  }
}

abstract class AppLocalizationLabel {
  const AppLocalizationLabel();

  String get localizationTitle;

  String get lanCode;




  /// Error Text
  String get defaultErrorMessage;

  String get serverErrorMessage;

  String get noInternetErrorMessage;

  String get unauthorizedErrorMessage;

  String get timeoutErrorMessage;

  /// Button Text

  String get cancelBtnText;

  String get tryAgainBtnText;

  /// Regex
  String get enterEmailAddressReqExMessage;

  String get enterValidEmailReqExMessage;

  String get enterTelNoReqExMessage;

  String get enterValidTelNoReqExMessage;

  String get enterValidCodeReqExMessage;

  String get enterNameReqExMessage;

  String get enterValidNameReqExMessage;

  String get enterSurnameReqExMessage;

  String get enterValidSurnameReqExMessage;

  String get requiredFieldReqExMessage;

  String get enterValidCardNoReqExMessage;

  String get enterValidDatReqExMessage;

  String get enterValidPasswordReqExMessage;

  String get unknownPageRouteMessageText;

}
