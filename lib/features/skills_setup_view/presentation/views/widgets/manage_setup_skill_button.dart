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
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class ManageSetupSkillsButton extends StatefulWidget {
  const ManageSetupSkillsButton({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  State<ManageSetupSkillsButton> createState() =>
      _ManageSetupSkillsButtonState();
}

class _ManageSetupSkillsButtonState extends State<ManageSetupSkillsButton> {
  Future<bool>? teachSkillsSaveFuture;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveSelectedSkillsCubit, SaveSelectedSkillsState>(
      listener: (context, state) {
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
          if (widget.currentPage == 2)
            Expanded(
              child: GestureDetector(
                onTap: navigateToPreviousPageView,
                child: const CustomBackButton(
                  text: 'Back',
                  icon: Icons.arrow_back,
                ),
              ),
            ),

          if (widget.currentPage == 2) const SizedBox(width: 15),

          Expanded(
            child: GestureDetector(
              onTap: () => onNextPressed(context),
              child: const CustomNextButton(text: 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onNextPressed(BuildContext context) async {
    if (widget.currentPage == 1) {
      teachSkillsSaveFuture = saveTeachSkills(context);

      if (!context.mounted) return;

      navigateToNextPageView(context);
      return;
    }

    if (widget.currentPage == 2) {
      final teachSuccess = await teachSkillsSaveFuture;

      if (teachSuccess != true) {
        return;
      }

      final learnSuccess = await saveLearnSkills(context);

      if (!learnSuccess) {
        return;
      }

      if (!context.mounted) return;

      await context.read<GetUserInfoCubit>().getUserInfo();

      if (!context.mounted) return;

      navigateToHome(context);
    }
  }

  Future<bool> saveTeachSkills(BuildContext context) async {
    final selectedSkills = context.read<SelectedTeachSkillsCubit>().state;

    final cubit = context.read<SaveSelectedSkillsCubit>();

    await cubit.saveSelectedSkills(
      selectedSkills: selectedSkills,
      fieldName: 'teachSkills',
    );

    return cubit.state is SaveSelectedSkillsSuccess;
  }

  Future<bool> saveLearnSkills(BuildContext context) async {
    final selectedSkills = context.read<SelectedLearnSkillsCubit>().state;

    final cubit = context.read<SaveSelectedSkillsCubit>();

    await cubit.saveSelectedSkills(
      selectedSkills: selectedSkills,
      fieldName: 'learnSkills',
    );

    return cubit.state is SaveSelectedSkillsSuccess;
  }

  void navigateToNextPageView(BuildContext context) {
    context.read<GetCategoryCubit>().resetCategory();

    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void navigateToHome(BuildContext context) {
    context.pushReplacement(AppRoutes.homeView);
  }

  void navigateToPreviousPageView() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
