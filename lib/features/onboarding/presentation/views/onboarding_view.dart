import 'package:flutter/material.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_body_desktop_layout.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_body_mobile_and_tablet_layout.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  static const List<OnboardingPageModel> items = [
    OnboardingPageModel(
      image: Assets.imagesSkillSharing,
      title: 'Share Your Skills with\nOthers',
      subTitle:
          'Turn your experience into an opportunity to \n learn something new without paying money.',
    ),

    OnboardingPageModel(
      image: Assets.imagesOnboarding2,
      title: 'Learn from Real People  \n Together',
      subTitle:
          'Find people who share your interests\nand learn directly from them.',
    ),

    OnboardingPageModel(
      image: Assets.imagesOnboarding3,
      title: 'Start Your First Skill \n Exchange',
      subTitle:
          'Create your profile and find the right learning \n partner. Your growth journey starts here.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AdaptiveLayoutWidget(
        mobileLayout: (context) => OnboardingBodyMobileAndTabletLayout(items: items,),
        tabletLayout: (context)=>OnboardingBodyMobileAndTabletLayout(items: items,),
        desktopLayout: (context)=>OnboardingBodyDesktopLayout(items: items,),
      ),
    );
  }
}