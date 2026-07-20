import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';

class ManageButton extends StatelessWidget {
  const ManageButton({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    if (currentPageIndex == 0) {
      return nextButton();
    } else if (currentPageIndex == 1) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              ),
              child: CustomBackButton(text: 'Back', icon: Icons.arrow_forward),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: nextButton()),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          GoRouter.of(context).pushReplacement(AppRoutes.loginview);
        },
        child: CustomNextButton(text: 'Get Started'),
      );
    }
  }

  GestureDetector nextButton() {
    return GestureDetector(
      onTap: navigateToNextPage,
      child: CustomNextButton(text: 'Next', icon: Icons.arrow_forward),
    );
  }

  void navigateToNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
