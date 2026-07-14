import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/features/authentication/presentation/screens/create_password_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/login_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/signup_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/verfication_screen.dart';
import 'package:drivehere/features/authentication/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteNames.verification:
        final isResetPasswordFlow = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) =>
              VerificationScreen(isResetPasswordFlow: isResetPasswordFlow),
        );
      case RouteNames.createPassword:
        return MaterialPageRoute(builder: (_) => const CreatePasswordScreen());
      case RouteNames.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
