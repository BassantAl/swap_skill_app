import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
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
    navigateToOnboardingView();
  }

  Future<void> navigateToOnboardingView() {
    return Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRoutes.onboardingview);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayoutWidget(
        mobileLayout: (context) => SplashViewBody(),
        tabletLayout: (context) => SplashViewBody(),
        desktopLayout: (context) => SplashViewBody(),
      ),
    );
  }
}
