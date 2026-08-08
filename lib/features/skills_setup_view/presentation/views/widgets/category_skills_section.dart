import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/view_all_categories_with_skills.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/view_one_category.dart';

class CategorySkillsSection extends StatelessWidget {
  const CategorySkillsSection({
    super.key,
    required this.isTeach,
  });

  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GetCategoryCubit>().state;

    if (state is GetCategoryInitial) {
      return ViewAllCategoriesWithSkills(
        isTeach: isTeach,
      );
    }

    if (state is GetCategoryLoading ||
        state is GetCategorySuccess) {
      return ViewOneCategory(
        isTeach: isTeach,
      );
    }

    if (state is GetCategoryFailure) {
      return ViewAllCategoriesWithSkills(
        isTeach: isTeach,
      );
    }

    return const SizedBox();
  }
}