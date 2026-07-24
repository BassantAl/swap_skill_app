import 'package:go_router/go_router.dart';
import 'package:swap_skill/features/auth/presentation/views/login_view.dart';
import 'package:swap_skill/features/auth/presentation/views/reset_password.dart';
import 'package:swap_skill/features/auth/presentation/views/signup_view.dart';
import 'package:swap_skill/features/home/presentation/views/home_view.dart';
import 'package:swap_skill/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:swap_skill/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String onboardingView = '/onboardingview';
  static const String loginView = '/loginview';
  static const String signupView = '/signupview';
   static const String homeView = '/homeview';
   static const String resetPasswordView = '/resetpasswordview';
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

      GoRoute(
        path: signupView,
        builder: (context, state) {
          return const SignupView();
        },
      ),

       GoRoute(
        path: resetPasswordView,
        builder: (context, state) {
          return const ResetPassword();
        },
      ),
    ],
  );
}
