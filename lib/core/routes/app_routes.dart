import 'package:go_router/go_router.dart';
import 'package:swap_skill/features/auth/presentation/views/login_view.dart';
import 'package:swap_skill/features/home/presentation/views/home_view.dart';
import 'package:swap_skill/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:swap_skill/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String onboardingView = '/onboardingview';
  static const String loginView = '/loginview';
   static const String homeView = '/homeview';
  static final router = GoRouter(
    routes: [
      
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

       GoRoute(
        path: onboardingView,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),

       GoRoute(
        path: loginView,
        builder: (context, state) {
          return const LoginView();
        },
      ),

      GoRoute(
        path: homeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
}
