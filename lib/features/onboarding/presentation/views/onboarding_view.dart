import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_body_mobile_layout.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AdaptiveLayoutWidget(
        mobileLayout: (context) => OnboardingBodyMobileLayout(),
        tabletLayout: (context)=>SizedBox(),
        desktopLayout: (context)=>SizedBox(),
      ),
    );
  }
}
