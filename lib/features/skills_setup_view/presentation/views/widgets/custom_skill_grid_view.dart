import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_skill_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSkillsGridView extends StatelessWidget {
  const CustomSkillsGridView({
    super.key,
    required this.skills,
    this.physics,
    required this.shrinkWrap,
    required this.isTeach,
  });
  final ScrollPhysics? physics;
  final List<String> skills;
  final bool shrinkWrap;
  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    return isTeach
        ? BlocBuilder<SelectedTeachSkillsCubit, List<String>>(
            builder: (context, selectedSkills) {
              return buildGrid(selectedSkills);
            },
          )
        : BlocBuilder<SelectedLearnSkillsCubit, List<String>>(
            builder: (context, selectedSkills) {
              return buildGrid(selectedSkills);
            },
          );
  }

  GridView buildGrid(List<String> selectedSkills) {
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
            if (isTeach) {
              context
                  .read<SelectedTeachSkillsCubit>()
                  .toggleSkill(skill: skill);
            } else {
              context
                  .read<SelectedLearnSkillsCubit>()
                  .toggleSkill(skill: skill);
            }
          },
          child: Center(
            child: ManageSkillCardState(
              text: skill,
              isActive: selectedSkills.contains(skill),
            ),
          ),
        );
      },
    );
  }
}
