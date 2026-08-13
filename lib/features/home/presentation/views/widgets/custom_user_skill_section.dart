import 'package:flutter/material.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/custom_learn_skills_section.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/custom_teach_skills_section.dart';
import 'package:swap_skill/shared/user/data/model/get_user_info_model.dart';

class CustomUserSkillsSection extends StatelessWidget {
  const CustomUserSkillsSection({super.key, required this.getUserInfoModel});
  final GetUserInfoModel getUserInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLearnSkillsSection(items: getUserInfoModel.learnSkills),
        SizedBox(height: 25),
        CustomTeachSkillsSection(items: getUserInfoModel.teachSkills),
      ],
    );
  }
}