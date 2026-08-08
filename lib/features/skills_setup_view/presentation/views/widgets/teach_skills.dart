import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_list_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/category_skills_section.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_search_and_add_skill_section.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skills_header.dart';

class TeachSkills extends StatelessWidget {
  const TeachSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkillsHeader(
            title: 'What Can You Teach?',
            subTitle:
                'Choose the skills you are confident sharing \n with others. This helps us match you with \n eager learners.',
          ),
          SizedBox(height: 20),
          CustomSearchAndAddSkillSection(isTeach: true,),
          SizedBox(height: 24),
          CategoriesListView(),
          SizedBox(height: 24),
          CategorySkillsSection(isTeach: true,),
        ],
      ),
    );
  }
}
