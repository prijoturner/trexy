import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static const String fontFamily = 'Axiforma';

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        primary: AppColors.primaryLight,
        secondary: AppColors.primaryLight,
        surface: AppColors.background,
        onSurface: AppColors.onBackground,
        brightness:
            Brightness.dark, // Force dark brightness for correct contrast
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.onBackground),
        titleTextStyle: TextStyle(
          color: AppColors.onBackground,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.onBackground),
        bodyMedium: TextStyle(color: AppColors.onBackground),
        titleLarge: TextStyle(color: AppColors.onBackground),
        titleMedium: TextStyle(color: AppColors.onBackground),
        titleSmall: TextStyle(color: AppColors.onBackground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: TextStyle(color: AppColors.textSecondary),
        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,
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
          borderSide: const BorderSide(color: AppColors.primaryLight),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme; // Use the same theme for now as the requirement is specific
  }
}
