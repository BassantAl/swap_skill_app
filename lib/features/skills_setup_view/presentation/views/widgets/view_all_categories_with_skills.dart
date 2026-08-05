import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/view_all_categories_success.dart';

class ViewAllCategoriesWithSkills extends StatelessWidget {
  const ViewAllCategoriesWithSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GetSkillsDataCubit>().state;

    if (state is GetSkillsDataLoading) {
      return const CustomLoadingIndicator();
    }

    if (state is GetSkillsDataFailure) {
      return CustomErrorWidget(errorMessage: state.errorMessage);
    }

    if (state is GetSkillsDataSuccess) {
      return ViewAllCategoriesSuccess(skills: state.skills);
    }

    return const SizedBox();
  }
}