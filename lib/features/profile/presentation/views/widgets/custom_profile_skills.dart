import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_learn_skill.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_teach_skill.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/skill_card_for_profile.dart';

class CustomProfileSkills extends StatelessWidget {
  const CustomProfileSkills({super.key, required this.teachSkills, required this.learnSkills});
  final List<String> teachSkills;
  final List<String> learnSkills;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: AppDecoration.containerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProfileLearnSkill(),
              const SizedBox(height: 5),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: learnSkills.length,
                  itemBuilder: (context,index) {
                    
                    return Padding(
                      padding: const EdgeInsets.only(right:  8.0),
                      child: SkillCardForProfile(
                        color: AppColors.secondary.withAlpha(50),
                        text: learnSkills[index],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(16),
          decoration: AppDecoration.containerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProfileTeachSkill(),
              const SizedBox(height: 5),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: teachSkills.length,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.only(right:  8.0),
                      child: SkillCardForProfile(
                        color: AppColors.lightPurple.withAlpha(50),
                        text: teachSkills[index],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
