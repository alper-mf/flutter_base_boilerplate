import 'package:flutter/material.dart';
import '../../../utils/size/padding_and_radius.dart';
import '../color/app_colors.dart';
import '../theme.dart';

class AppLightTheme implements AppTheme {
  AppLightTheme();

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get backgroundColor => AppColors.backgroundColor;

  @override
  Color get scaffoldBackgroundColor => AppColors.backgroundColor;

  @override
  IconThemeData get accentIconTheme =>
      IconThemeData(color: AppColors.textColor, size: 24);

  @override
  IconThemeData get primaryIconTheme =>
      IconThemeData(color: AppColors.textColor, size: 24);

  @override
  IconThemeData get iconTheme => IconThemeData(color: AppColors.textColor);

  @override
  Color get cardColor => AppColors.grey.shade100;

  @override
  Color get bottomAppBarColor => Colors.white;

  @override
  Color get dividerColor => AppColors.tertiary;

  @override
  Color get shadowColor => Colors.black26;

  @override
  Color get indicatorColor => AppColors.secondary;

  @override
  ProgressIndicatorThemeData get progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColors.secondary);

  @override
  Color get primaryColorDark => AppColors.primary;

  @override
  Color get primaryColorLight => AppColors.primary;

  @override
  Color get hintColor => AppColors.grayColor;

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: AppColors.primary,
        onPrimary: AppColors.textColorGrey,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.pink,
        scrim: AppColors.yellow,
        secondaryContainer: AppColors.textColor,
        surface: AppColors.textColorBlack,
        onSurface: AppColors.textColor,
        background: AppColors.backgroundColor,
        onBackground: AppColors.greenColor,
        error: AppColors.secondary,
        onError: Colors.white,
        errorContainer: AppColors.secondary,
        brightness: Brightness.light,
        outline: AppColors.grey.shade600,
      );

  @override
  ColorScheme get buttonColorScheme => ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primary,
        secondary: AppColors.tertiary,
        secondaryContainer: AppColors.tertiary,
        surface: Colors.white,
        background: AppColors.primary,
        error: AppColors.secondary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light,
      );

  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppColors.tertiary,
            width: 1,
          ),
        ),
        color: AppColors.cardColor,
        margin: EdgeInsets.zero,
      );

  @override
  TextTheme get textTheme => TextTheme(
        ///HeadLine
        displayLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),
        displayMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),

        ///BodyText
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),
        titleSmall: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.grey.shade600,
          disabledForegroundColor: Colors.white,
          fixedSize: const Size(double.infinity, 56),
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  @override
  DatePickerThemeData datePickerThemeData = DatePickerThemeData(
    backgroundColor: AppColors.tertiary,
    yearStyle: const TextStyle(fontSize: 16),
    headerHelpStyle: const TextStyle(fontSize: 16),
    todayForegroundColor:
        MaterialStateProperty.all(AppColors.backgroundColor.withOpacity(.3)),
    headerBackgroundColor: AppColors.tertiary,
    dayStyle: const TextStyle(fontSize: 16, color: Colors.white),
    todayBackgroundColor:
        MaterialStateProperty.all(AppColors.onSecondary.withOpacity(.3)),
    headerForegroundColor: AppColors.textColor,
    dayForegroundColor: MaterialStateProperty.all(AppColors.textColor),
    weekdayStyle: TextStyle(color: AppColors.textColor, fontSize: 16),
    dayOverlayColor: MaterialStateProperty.all(AppColors.textColor),
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.grayColor,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
          borderRadius: BorderRadius.circular(5),
        ),
      );

  @override
  TextSelectionThemeData get textSelectionThemeData => TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary.withOpacity(0.2),
        selectionHandleColor: AppColors.primary,
      );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.textColor),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      );

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppColors.primary);
            }
            return BorderSide(color: AppColors.textColor);
          }),
          fixedSize: MaterialStateProperty.all(
            const Size(double.infinity, 56),
          ),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.textColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: AppColors.primary,
              fontSize: 20,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color?>(AppColors.secondary),
        checkColor: MaterialStateProperty.all<Color?>(Colors.white),
        side: BorderSide(width: 0.7, color: AppColors.secondary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXXXL),
        ),
      );

  @override
  RadioThemeData get radioThemeData => RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
      );

  @override
  DividerThemeData get dividerTheme =>
      DividerThemeData(color: AppColors.tertiary, space: 0, thickness: 1);

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: .5,
        shadowColor: AppColors.tertiary,
        color: AppColors.backgroundColor,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.primary),
        iconTheme: IconThemeData(color: AppColors.primary),
      );

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme(
        color: Colors.white,
        elevation: 0,
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        backgroundColor: AppColors.cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusL)),
      );
}
