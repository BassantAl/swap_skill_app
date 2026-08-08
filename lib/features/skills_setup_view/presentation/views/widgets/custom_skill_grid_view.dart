import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skill_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSkillsGridView extends StatelessWidget {
  const CustomSkillsGridView({super.key, required this.skills, this.physics, required this.shrinkWrap, });
  final ScrollPhysics? physics;
  final List<String> skills;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedSkillsCubit, List<String>>(
      builder: (context, selectedSkills) {
        return GridView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          itemCount: skills.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            childAspectRatio: 3.5,
          ),
          itemBuilder: (context, index) {
            final skill = skills[index];

            return GestureDetector(
              onTap: () {
                context.read<SelectedSkillsCubit>().toggleSkill(skill: skill);
              },
              child: Center(
                child: SkillCard(
                  text: skill,
                  isActive: selectedSkills.contains(skill),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
