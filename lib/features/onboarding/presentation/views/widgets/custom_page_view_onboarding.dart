import 'package:flutter/material.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_page_item.dart';

class CustomPageViewOnboarding extends StatelessWidget {
  const CustomPageViewOnboarding({
    super.key,
    this.pageController,
    required this.items,
  });

  final PageController? pageController;
  final List<OnboardingPageModel> items;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return OnboardingPageItem(onboardingPageModel: items[index]);
      },
    );
  }
}
