import 'package:flutter/material.dart';
import '../../core/presentation/pages/main_page.dart';
import '../../core/presentation/pages/register_page.dart';
import '../../core/presentation/pages/forgot_password_page.dart';

class AppRoutes {
  static const String main = '/';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
