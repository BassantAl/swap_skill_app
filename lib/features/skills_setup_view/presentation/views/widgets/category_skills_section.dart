import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/view_all_categories_with_skills.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/view_one_category.dart';

class CategorySkillsSection extends StatelessWidget {
  const CategorySkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GetCategoryCubit>().state;

    if (state is GetCategoryLoading ||
        state is GetCategorySuccess ||
        state is GetCategoryFailure) {
      return const ViewOneCategory();
    }

    return const ViewAllCategoriesWithSkills();
  
  }
}