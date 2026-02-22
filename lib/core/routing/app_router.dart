import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/screen/password_update/password_update_screen.dart';
import 'package:shopzen/feature/auth/presentation/screen/verify_email/verify_email_screen.dart';
import 'package:shopzen/feature/auth/presentation/screen/login/login_screen.dart';
import 'package:shopzen/feature/auth/presentation/screen/resend_otp_screen/resend_otp_screen.dart';
import 'package:shopzen/feature/auth/presentation/screen/register_screen/register_screen.dart';
import 'package:shopzen/feature/home/presentation/screen/home_screen.dart';
import 'package:shopzen/feature/onboarding/screen/onboarding_screen.dart';
import 'package:shopzen/feature/splach/presentation/screen/splach_screen.dart';

class RoutGenerator {
  static final GoRouter mainAppRouter = GoRouter(
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(state.error.toString()))),
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const VerifyEmailScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpScreen,
        builder: (context, state) => const ResendOtpScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordUpdate,
        builder: (context, state) => const PasswordUpdateScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
