import 'package:go_router/go_router.dart';
import 'package:swap_skill/features/auth/presentation/views/login_view.dart';
import 'package:swap_skill/features/auth/presentation/views/reset_password.dart';
import 'package:swap_skill/features/auth/presentation/views/signup_view.dart';
import 'package:swap_skill/features/chats/presentation/views/chats_view.dart';
import 'package:swap_skill/features/home/presentation/views/home_view.dart';
import 'package:swap_skill/features/main/presentation/views/main_view.dart';
import 'package:swap_skill/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:swap_skill/features/my_profile/presentation/views/my_profile_view.dart';
import 'package:swap_skill/features/search/presentation/views/search_view.dart';
import 'package:swap_skill/features/splash/presentation/views/splash_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/skills_setup.dart';
import 'package:swap_skill/features/swaps/presentation/views/swaps_view.dart';
import 'package:swap_skill/features/user_profile/presentation/views/user_profile_view.dart';

abstract class AppRoutes {
  static const String onboardingView = '/onboardingview';
  static const String loginView = '/loginview';
  static const String signupView = '/signupview';
  static const String resetPasswordView = '/resetpasswordview';
  static const String skillsSetupView = '/skillssetupview';
  static const String userProfileView = '/userProfileView';

  static const String homeView = '/homeview';
  static const String searchView = '/searchview';
  static const String swapsView = '/swapsview';
  static const String chatsView = '/chatsview';
  static const String profileView = '/profileview';
  static const String skillDetailsView = '/skillDetailsView';

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainView(child: child,);
        },
        routes: [
          GoRoute(
      path: AppRoutes.homeView,
      pageBuilder: (context, state) => NoTransitionPage(child: const HomeView()),
    ),
    GoRoute(
      path: AppRoutes.searchView,
      pageBuilder: (context, state) => NoTransitionPage(child: const SearchView()),
    ),
    GoRoute(
      path: AppRoutes.swapsView,
      pageBuilder: (context, state) => NoTransitionPage(child: const SwapsView()),
    ),
    GoRoute(
      path: AppRoutes.chatsView,
      pageBuilder: (context, state) => NoTransitionPage(child: const ChatsView()),
    ),
    GoRoute(
      path: AppRoutes.profileView,
      pageBuilder: (context, state) => NoTransitionPage(child: const MyProfileView()),
    ),
        ],
      ),
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

      GoRoute(
        path: skillsSetupView,
        builder: (context, state) {
          return const SkillsSetup();
        },
      ),

      GoRoute(
        path: userProfileView,
        builder: (context, state) {
          return const UserProfileView();
        },
      ),
      
    ],
  );
}
