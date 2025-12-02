import 'package:flutter/material.dart';

/// App color palette using semantic naming for better maintainability
class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF00DF81); // Main brand color
  static const Color primaryDark = Color(0xFF00C06E); // Darker shade
  static const Color primaryLight = Color(0xFF2CC295); // Lighter shade

  // Background Colors
  static const Color background = Color(0xFF000F11); // Main background
  static const Color surface = Color(0xFF032221); // Cards/containers
  static const Color surfaceVariant = Color(0xFF06302B); // Alternative surface

  // Text Colors
  static const Color onBackground = Color(0xFFF1F7F6); // Text on background
  static const Color onSurface = Color(0xFFF1F7F6); // Text on surface
  static const Color onPrimary = Color(0xFF000F11); // Text on primary color
  static const Color textSecondary = Color(0xFF707D7D); // Secondary text
  static const Color textDisabled = Color(0xFFAACBC4); // Disabled text

  // Accent Colors
  static const Color accent = Color(0xFF03624C); // Accent color
  static const Color accentLight = Color(0xFF2FA98C); // Light accent

  // Additional Shades (for specific use cases)
  static const Color shade1 = Color(0xFF0B453A); // basil
  static const Color shade2 = Color(0xFF095544); // forest
  static const Color shade3 = Color(0xFF17876D); // frog

  // Semantic State Colors
  static const Color success = Color(0xFF00DF81); // Success state
  static const Color error = Color(0xFFFF5252); // Error state
  static const Color warning = Color(0xFFFFA726); // Warning state
  static const Color info = Color(0xFF29B6F6); // Info state

  // MaterialColor for ThemeData.primarySwatch
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF00DF81, <int, Color>{
        50: Color(0xFFE0FBEF),
        100: Color(0xFFB3F6D7),
        200: Color(0xFF80F0BD),
        300: Color(0xFF4DEAA2),
        400: Color(0xFF26E48E),
        500: Color(0xFF00DF81),
        600: Color(0xFF00D179),
        700: Color(0xFF00C06E),
        800: Color(0xFF00B064),
        900: Color(0xFF009451),
      });
}
