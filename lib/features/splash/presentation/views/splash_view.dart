import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:swap_skill/features/splash/presentation/views/widgets/splash_view_body.dart';

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

  Future<void> navigateBasedOnUserState() {
    return Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      final repo = getIt<SplashRepo>();
      if (repo.currentUser == null) {
        GoRouter.of(context).pushReplacement(AppRoutes.onboardingView);
        return;
      }
      context.read<GetUserInfoCubit>().getUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          final learnSkills = state.getUserInfoModel.learnSkills;
          final teachSkills = state.getUserInfoModel.teachSkills;

          final bool hasSkills =
              (learnSkills.isNotEmpty) || (teachSkills.isNotEmpty);

          if (hasSkills) {
            GoRouter.of(context).pushReplacement(AppRoutes.homeView);
          } else {
            GoRouter.of(context).pushReplacement(AppRoutes.skillsSetupView);
          }
          log('hasSkills: $hasSkills');
        }

        if (state is GetUserInfoFailure) {
          GoRouter.of(context).pushReplacement(AppRoutes.skillsSetupView);
        }
      },
      child: Scaffold(
        body: AdaptiveLayoutWidget(
          mobileLayout: (context) => SplashViewBody(),
          tabletLayout: (context) => SplashViewBody(),
          desktopLayout: (context) => SplashViewBody(),
        ),
      ),
    );
  }
}
