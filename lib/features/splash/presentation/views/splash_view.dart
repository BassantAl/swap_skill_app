import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';
import 'package:swap_skill/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateBasedOnUserState();
  }

  Future<void> navigateBasedOnUserState() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  if (!mounted) return;

  final repo = getIt<SplashRepo>();

  final hasSeenOnboarding = await repo.hasSeenOnboarding();

  if (!mounted) return;

  if (!hasSeenOnboarding) {
    context.go(AppRoutes.onboardingView);
    return;
  }

  final user = repo.currentUser;

  if (user == null) {
    context.go(AppRoutes.loginView);
    return;
  }

  final isVerified = await repo.checkEmailVerification();

  if (!mounted) return;

  if (!isVerified) {
    context.go(AppRoutes.emailVerificationView);
    return;
  }

  context.read<GetUserInfoCubit>().getUserInfo();
}

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          final learnSkills = state.getUserInfoModel.learnSkills;
          final teachSkills = state.getUserInfoModel.teachSkills;

          final hasSkills = learnSkills.isNotEmpty || teachSkills.isNotEmpty;

          log('hasSkills: $hasSkills');

          if (hasSkills) {
            context.go(AppRoutes.homeView);
          } else {
            context.go(AppRoutes.skillsSetupView);
          }
        }

        if (state is GetUserInfoFailure) {
          context.go(AppRoutes.skillsSetupView);
        }
      },
      child: Scaffold(
        body: AdaptiveLayoutWidget(
          mobileLayout: (context) => const SplashViewBody(),
          tabletLayout: (context) => const SplashViewBody(),
          desktopLayout: (context) => const SplashViewBody(),
        ),
      ),
    );
  }
}
