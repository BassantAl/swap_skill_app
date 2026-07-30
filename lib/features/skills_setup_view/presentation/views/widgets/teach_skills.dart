import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_active_item.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_inactive_item.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_list_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_search_and_add_skill_section.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills_header.dart';

class TeachSkills extends StatelessWidget {
  const TeachSkills({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TeachSkillsHeader(),
           SizedBox(height: 20,),
          CustomSearchAndAddSkillSection(),
          SizedBox(height: 24,),
          CategoriesListView(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

