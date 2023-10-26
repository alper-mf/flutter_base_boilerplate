import 'package:flutter/material.dart';
import '../../../utils/size/padding_and_radius.dart';
import '../color/app_colors.dart';
import '../theme.dart';

class AppDarkTheme implements AppTheme {
  AppDarkTheme({AppColors? AppColors});

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get backgroundColor => Colors.black;

  @override
  Color get scaffoldBackgroundColor => Colors.black;

  @override
  IconThemeData get accentIconTheme => const IconThemeData(color: Colors.black);

  @override
  IconThemeData get primaryIconTheme => const IconThemeData(color: Colors.black);

  @override
  IconThemeData get iconTheme => const IconThemeData(color: Colors.black);

  @override
  Color get cardColor => Colors.black;

  @override
  Color get bottomAppBarColor => Colors.black;

  @override
  Color get dividerColor => AppColors.lightWhite;

  @override
  Color get shadowColor => Colors.black26;

  @override
  ProgressIndicatorThemeData get progressIndicatorTheme => ProgressIndicatorThemeData(color: AppColors.primary);

  @override
  Color get primaryColorDark => AppColors.primary;

  @override
  Color get primaryColorLight => AppColors.primary;

  @override
  Color get hintColor => AppColors.grey.shade600;

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        secondary: Colors.white,
        secondaryContainer: Colors.white,
        tertiary: AppColors.tertiary,
        surface: AppColors.cardColor,
        background: AppColors.grey.shade100,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: AppColors.grey.shade800,
        onSurface: Colors.white,
        onBackground: AppColors.grey.shade600,
        onError: Colors.white,
        brightness: Brightness.dark,
        outline: AppColors.grey.shade600,
      );

  @override
  ColorScheme get buttonColorScheme => ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.primaryContainer,
        secondaryContainer: AppColors.primaryContainer,
        surface: Colors.white,
        background: AppColors.primary,
        error: AppColors.red.shade800,
        onPrimary: Colors.white,
        onSecondary: AppColors.onSecondary,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light,
        errorContainer: AppColors.red.shade600,
      );

  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXXS)),
        color: Colors.black,
        margin: EdgeInsets.zero,
      );

  @override
  TextTheme get textTheme => TextTheme(
        ///HeadLine
        displayLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        displayMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        headlineMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),

        ///BodyText
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        bodyMedium: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey.shade800,
        ),
        titleSmall: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
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
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusXL),
          ),
        ),
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade800,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.grey.shade600,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radiusXS,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radiusXS,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radiusXS,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radiusXS,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radiusXS,
          ),
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
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      );

  @override
  DatePickerThemeData datePickerThemeData = DatePickerThemeData(
  backgroundColor: AppColors.appBarColor,
  headerBackgroundColor: AppColors.appBarColor,
  headerForegroundColor: AppColors.appBarColor,
  dayForegroundColor: MaterialStateProperty.all(AppColors.appBarColor),
  dayOverlayColor: MaterialStateProperty.all(AppColors.appBarColor),
  dayStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  yearStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  weekdayStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  headerHelpStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  headerHeadlineStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  rangePickerHeaderHelpStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
  rangePickerHeaderHeadlineStyle:  TextStyle(
    color: AppColors.appBarColor, // Adjust as needed
  ),
);


  @override
  OutlinedButtonThemeData get outlinedButtonThemeData => OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.grey.shade800),
          side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) return BorderSide(color: AppColors.grey.shade100);
            return BorderSide(color: AppColors.grey.shade800);
          }),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: AppColors.grey.shade800,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusXL),
            ),
          ),
        ),
      );

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color?>(AppColors.primary),
        checkColor: MaterialStateProperty.all<Color?>(Colors.white),
        side: BorderSide(width: 0.7, color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusXXXS),
        ),
      );

  @override
  RadioThemeData get radioThemeData => RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
      );

  @override
  DividerThemeData get dividerTheme => DividerThemeData(
        color: AppColors.lightWhite,
        space: 0,
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        titleSpacing: 0,
        elevation: 0,
        color: AppColors.appBarColor,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.onAppBarColor,
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.onAppBarColor),
        iconTheme: IconThemeData(color: AppColors.onAppBarColor),
      );

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: AppColors.primary,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        unselectedLabelColor: AppColors.grey.shade800,
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.grey.shade800,
        ),
      );

  @override
  Color get indicatorColor => AppColors.primary;

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusL)),
      );
}
