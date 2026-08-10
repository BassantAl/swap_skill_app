import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/save_selected_skills_cubit/save_selected_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';

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
    return BlocListener<SaveSelectedSkillsCubit, SaveSelectedSkillsState>(
      listener: (context, state) {
        if (state is SaveSelectedSkillsSuccess) {
          if (currentPage == 1) {
            navigateToNextPageView(context);
          } else if (currentPage == 2) {
            navigateToHome(context);
          }
        }

        if (state is SaveSelectedSkillsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.secondary,
              content: CustomErrorWidget(errorMessage: state.errorMessage),
            ),
          );
        }
      },
      child: Row(
        children: [
          if (currentPage == 2)
            Expanded(
              child: GestureDetector(
                onTap: navigateToPreviousPageView,
                child: const CustomBackButton(
                  text: 'Back',
                  icon: Icons.arrow_back,
                ),
              ),
            ),

          if (currentPage == 2) const SizedBox(width: 15),

          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentPage == 1) {
                  final selectedSkills = context
                      .read<SelectedTeachSkillsCubit>()
                      .state;

                  context.read<SaveSelectedSkillsCubit>().saveSelectedSkills(
                    selectedSkills: selectedSkills,
                    fieldName: 'teachSkills',
                  );
                }

                if (currentPage == 2) {
                  final selectedSkills = context
                      .read<SelectedLearnSkillsCubit>()
                      .state;

                  context.read<SaveSelectedSkillsCubit>().saveSelectedSkills(
                    selectedSkills: selectedSkills,
                    fieldName: 'learnSkills',
                  );
                }
              },
              child: const CustomNextButton(text: 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNextPageView(BuildContext context) {
    context.read<GetCategoryCubit>().resetCategory();

    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void navigateToHome(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRoutes.homeView);
  }

  void navigateToPreviousPageView() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
