import 'package:flutter/material.dart';
import '../../features/auth/splash_page.dart';
import '../../features/auth/login.dart';
import '../../features/auth/register.dart';
import '../../features/auth/forgot_password.dart';
import '../../features/auth/create_password.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());

      case RouteNames.createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPasswordPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
