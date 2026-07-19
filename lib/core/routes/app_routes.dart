import 'package:go_router/go_router.dart';
import 'package:swap_skill/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:swap_skill/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String onboardingview = '/onboardingview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

       GoRoute(
        path: onboardingview,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
    ],
  );
}
