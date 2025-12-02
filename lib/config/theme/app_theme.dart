import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static const String fontFamily = 'Axiforma';

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mountainMeadow,
        primary: AppColors.mountainMeadow,
        secondary: AppColors.mountainMeadow,
        surface: AppColors.richBlack,
        onSurface: AppColors.antiFlashWhite,
        brightness:
            Brightness.dark, // Force dark brightness for correct contrast
      ),
      scaffoldBackgroundColor: AppColors.richBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.richBlack,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.antiFlashWhite),
        titleTextStyle: TextStyle(
          color: AppColors.antiFlashWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.antiFlashWhite),
        bodyMedium: TextStyle(color: AppColors.antiFlashWhite),
        titleLarge: TextStyle(color: AppColors.antiFlashWhite),
        titleMedium: TextStyle(color: AppColors.antiFlashWhite),
        titleSmall: TextStyle(color: AppColors.antiFlashWhite),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkGreen,
        hintStyle: TextStyle(color: AppColors.stone),
        prefixIconColor: AppColors.stone,
        suffixIconColor: AppColors.stone,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.mountainMeadow),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme; // Use the same theme for now as the requirement is specific
  }
}
