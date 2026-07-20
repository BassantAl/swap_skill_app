import 'package:flutter/material.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/dots_indicator.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/manage_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_page_item.dart';

class OnboardingBodyMobileLayout extends StatefulWidget {
  const OnboardingBodyMobileLayout({super.key});

  @override
  State<OnboardingBodyMobileLayout> createState() =>
      _OnboardingBodyMobileLayoutState();
}

class _OnboardingBodyMobileLayoutState
    extends State<OnboardingBodyMobileLayout> {
  static const List<OnboardingPageModel> items = [
    OnboardingPageModel(
      image: Assets.imagesSkillSharing,
      title: 'Share Your Skills with\nOthers',
      subTitle:
          'Turn your experience into an opportunity to \n learn something new without paying money.',
    ),

    OnboardingPageModel(
      image: Assets.imagesOnboarding2,
      title: 'Learn from Real People',
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

  late PageController pageController;
  int currentPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            CustomSkipButton(),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return OnboardingPageItem(onboardingPageModel: items[index]);
                },
              ),
            ),
            SizedBox(height: 5,),
             DotsIndicator(currentPageIndex: currentPageIndex),
            const SizedBox(height: 20,),
             ManageButton(currentPageIndex: currentPageIndex,pageController: pageController,),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
