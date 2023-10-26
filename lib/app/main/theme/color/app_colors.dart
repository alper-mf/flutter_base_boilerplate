import 'package:flutter/material.dart';

abstract class AppColors {
  static Color primary = const Color(0xFF3127A7);
  static Color primaryContainer = const Color(0xff3127A7);
  static Color secondary = const Color(0xffEB4C3A);
  static Color tertiary = const Color(0xFFEBE9F6);
  static Color textColor = const Color(0xFF1D166F);
  static Color textColorBlack = const Color(0xFF180d40);
  static Color textColorGrey = const Color(0xFF858282);
  static Color greenColor = const Color(0xff50AE45);
  static Color backgroundColor = const Color(0xffFDFDFF);
  static Color grayColor = const Color(0xFF858282);
  static Color pink = const Color(0xFFFFC0CB);
  static Color yellow = const Color(0xFFFFD500);

  static Color appBarColor = const Color(0xff344c98);
  static Color onAppBarColor = Colors.white;
  static Color onSecondary = AppColors.grey.shade800;
  static Color azureishWhite = const Color(0xffE0E4F1);
  static Color cardColor = const Color(0xffFDFDFF);
  static Color lightWhite = const Color(0xffefefef).withOpacity(0.8);

  static MaterialColor grey = const MaterialColor(
    0xFF9E9E9E,
    <int, Color>{
      100: Color(0xFFF1F2F4), // background
      200: Color(0xffD2D6DB), // lightGrey
      600: Color(0xFF9E9E9E), // paleColor
      800: Color(0xFF333333), // darkText
    },
  );

  static MaterialColor green = const MaterialColor(
    0xFF32D583,
    <int, Color>{
      200: Color(0xFFECFDF3), // lightGreen
      600: Color(0xFF32D583),
      800: Color(0xFF039855), // shamrockGreen
    },
  );

  static MaterialColor red = const MaterialColor(
    0xffF97066,
    <int, Color>{
      200: Color(0xffFEF3F2),
      600: Color(0xffF97066), // errorContainer
      800: Color(0xffD92D20), // errorColor
    },
  );

  static MaterialColor blue = const MaterialColor(
    0xFF53B1FD,
    <int, Color>{
      100: Color(0xffEAF5FF), // aliceBlue
      200: Color(0xFFEFF8FF), // lightBlue
      600: Color(0xFF53B1FD),
      800: Color(0xFF1570EF),
      900: Color(0xFF27356F), // darkBlue
    },
  );

  static MaterialColor orange = const MaterialColor(
    0xFFFDB022,
    <int, Color>{
      200: Color(0xFFFFFAEB),
      600: Color(0xFFFDB022),
      800: Color(0xFFDC6803),
    },
  );
}
