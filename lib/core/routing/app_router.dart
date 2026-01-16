import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/screen/login/login_screen.dart';
import 'package:shopzen/feature/onboarding/screen/onboarding_screen.dart';

class RoutGenerator {
  static final GoRouter mainAppRouter = GoRouter(
    
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(state.error.toString()),
    )),
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
