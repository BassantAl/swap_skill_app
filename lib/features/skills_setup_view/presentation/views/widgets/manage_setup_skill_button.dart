import 'package:flutter/material.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';

class ManageSetupSkillsButton extends StatelessWidget {
  const ManageSetupSkillsButton({super.key, required this.pageController, required this.currentPage});

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 1) {
      return GestureDetector(
        onTap: nevigateToNextPageView,
        child: CustomNextButton(text: 'Next'),
      );
    }
    return Row(
      children: [
        Expanded(child: GestureDetector(
          onTap:nevigateToNextPreviousView ,
          child: CustomBackButton(text: 'Back',icon: Icons.arrow_back,))),
        SizedBox(width: 15),
        Expanded(child: GestureDetector(
          onTap: nevigateToNextPageView,
          child: CustomNextButton(text: 'Next'))),
      ],
    );
  }

  void nevigateToNextPageView() {
    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void nevigateToNextPreviousView() {
    pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
