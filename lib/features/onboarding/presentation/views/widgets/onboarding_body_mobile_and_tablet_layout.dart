import 'package:flutter/material.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_page_view_onboarding.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/dots_indicator.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/manage_button.dart';

class OnboardingBodyMobileAndTabletLayout extends StatefulWidget {
  const OnboardingBodyMobileAndTabletLayout({super.key, required this.items});
  final List<OnboardingPageModel> items;
  @override
  State<OnboardingBodyMobileAndTabletLayout> createState() =>
      _OnboardingBodyMobileAndTabletLayoutState();
}

class _OnboardingBodyMobileAndTabletLayoutState
    extends State<OnboardingBodyMobileAndTabletLayout> {
  late PageController pageController;
  int currentPageIndex = 0;
  int itemCount = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSkipButton(),
            CustomPageViewOnboarding(
              pageController: pageController,
              items: widget.items,
            ),
            const SizedBox(height: 20),
            DotsIndicator(
              currentPageIndex: currentPageIndex,
              itemCount: widget.items.length,
            ),
            const SizedBox(height: 20),
            ManageButton(
              currentPageIndex: currentPageIndex,
              pageController: pageController,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
