import 'package:flutter/material.dart';
import 'package:todo_app/features/common/presentation/style/colors.dart';
import 'package:todo_app/features/common/presentation/style/text_styles.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: bottomNavBarColorLight,
    ),
    shadowColor: shadowColorLight,
    appBarTheme: const AppBarTheme(
      color: primaryColorLight,
      iconTheme: IconThemeData(
        color: foregroundColorLight,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      onPrimary: textColorLight,
      secondary: secondaryColorLight,
      background: backgroundColorLight,
      error: redColorLight,
    ),
    bannerTheme: const MaterialBannerThemeData(
      backgroundColor: primaryColorLight,
      surfaceTintColor: secondaryColorLight,
    ),
    cardTheme: const CardTheme(
      color: foregroundColorLight,
      shadowColor: shadowColorLight,
      surfaceTintColor: dateBackgroundColorLight,
    ),
    iconTheme: const IconThemeData(
      color: labelColorLight,
    ),
    textTheme: const TextTheme(
      titleLarge: titleLargeTextStyle,
      titleMedium: titleMediumTextStyle,
      titleSmall: titleSmallTextStyle,
      labelLarge: labelLargeTextStyle,
      displayMedium: displayMediumTextStyle,
      displaySmall: displaySmallTextStyle,
      bodyMedium: bodyMediumTextSyle,
      bodySmall: TextStyle(fontSize: 12),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorDark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: bottomNavBarColorDark,
    ),
    shadowColor: shadowColorDark,
    appBarTheme: const AppBarTheme(
      color: primaryColorDark,
      iconTheme: IconThemeData(
        color: foregroundColorDark,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
      onPrimary: textColorDark,
      secondary: secondaryColorDark,
      background: backgroundColorDark,
      error: redColorDark,
    ),
    bannerTheme: const MaterialBannerThemeData(
      backgroundColor: primaryColorDark,
      surfaceTintColor: secondaryColorDark,
    ),
    cardTheme: const CardTheme(
      color: foregroundColorDark,
      shadowColor: shadowColorDark,
      surfaceTintColor: dateBackgroundColorDark,
    ),
    iconTheme: const IconThemeData(
      color: labelColorDark,
    ),
    textTheme: const TextTheme(
      titleLarge: titleLargeTextStyle,
      titleMedium: titleMediumTextStyle,
      titleSmall: titleSmallTextStyle,
      labelLarge: labelLargeTextStyle,
      displayMedium: displayMediumTextStyle,
      displaySmall: displaySmallTextStyle,
      bodyMedium: bodyMediumTextSyle,
      bodySmall: TextStyle(fontSize: 12),
    ),
  );
}

extension CustomTextStyles on TextTheme {
  TextStyle get dateSmall => dateSmallTextStyle;

  TextStyle get dateLarge => dateLargeTextStyle;

  TextStyle get error => errorTextStyle;
}
