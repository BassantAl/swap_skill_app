import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_skill_grid_view.dart';

class ViewAllCategoriesSuccess extends StatelessWidget {
  const ViewAllCategoriesSuccess({super.key, required this.skills, required this.isTeach});
  final List<CategoriesModel> skills;
  final bool isTeach;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.38,
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skills[index].name,
                      style: AppStyles.semiBold24(context),
                    ),
                    const SizedBox(height: 15),
                    CustomSkillsGridView(
                      isTeach: isTeach,
                      shrinkWrap: true,
                      skills: skills[index].skills.skills,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
