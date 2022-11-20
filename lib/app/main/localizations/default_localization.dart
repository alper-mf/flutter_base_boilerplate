import 'package:flutter/material.dart';

import 'lan/en.dart';
import 'lan/tr.dart';

/// Default Locale ayarlarımız
const kDefaultLocal = Locale('tr');

/// Ugulamanın desteklediği diler
const Map<String, AppLocalizationLabel> supportedLocalization = {
  'tr': TrLocalization(),
  'en': EnLocalization(),
};

List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );

abstract class AppLocalizationLabel {
  const AppLocalizationLabel();

  String get hi;

  /// Code Country
  Map<String, String> get country;
}
