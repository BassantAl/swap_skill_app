import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';


class ManageSetupSkillsButton extends StatelessWidget {
  const ManageSetupSkillsButton({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 1) {
      return GestureDetector(
        onTap: () => nevigateToNextPageView(context),
        child: const CustomNextButton(text: 'Next'),
      );
    }

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: nevigateToPreviousPageView,
            child: const CustomBackButton(
              text: 'Back',
              icon: Icons.arrow_back,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () => nevigateToNextPageView(context),
            child: const CustomNextButton(text: 'Next'),
          ),
        ),
      ],
    );
  }

  void nevigateToNextPageView(BuildContext context) {
    context.read<GetCategoryCubit>().resetCategory();

    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void nevigateToPreviousPageView() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
