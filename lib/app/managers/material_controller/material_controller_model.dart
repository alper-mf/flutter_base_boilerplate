import 'package:flutter/material.dart';

class MaterialControllerModel {
  final Locale locale;
  final ThemeData themeData;

  MaterialControllerModel({required this.locale, required this.themeData});

  MaterialControllerModel copyWith({
    final Locale? locale,
    final ThemeData? themeData,
  }) =>
      MaterialControllerModel(locale: locale ?? this.locale, themeData: themeData ?? this.themeData);
}
