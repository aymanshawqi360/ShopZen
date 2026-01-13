import 'package:go_router/go_router.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/onboarding/screen/onboarding_screen.dart';

class RoutGenerator {
  static final GoRouter mainAppRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}