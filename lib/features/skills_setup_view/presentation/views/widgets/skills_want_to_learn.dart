import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_list_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/category_skills_section.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_search_and_add_skill_section.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skills_header.dart';

class SkillsWantToLearn extends StatelessWidget {
  const SkillsWantToLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkillsHeader(
            title: 'What Do You Want to \n Learn?',
            subTitle: 'Select the skills you\'d like to learn from others.',
          ),
          SizedBox(height: 20),
          CustomSearchAndAddSkillSection(),
          SizedBox(height: 24),
          CategoriesListView(),
          SizedBox(height: 24),
          CategorySkillsSection(isTeach: false,),
        ],
      ),
    );
  }
}
