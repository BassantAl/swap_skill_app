import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/active_skill_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_setup_skill_button.dart';

class SetupSkillsFooter extends StatelessWidget {
  const SetupSkillsFooter({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (currentPage == 1)
            BlocBuilder<SelectedTeachSkillsCubit, List<String>>(
              builder: (context, state) {
                return CustomFooterBody(
                  skills: state,
                  onRemoveSkill: (skill) {
                    context
                        .read<SelectedTeachSkillsCubit>()
                        .removeSkill(skill);
                  },
                );
              },
            )
          else if (currentPage == 2)
            BlocBuilder<SelectedLearnSkillsCubit, List<String>>(
              builder: (context, state) {
                return CustomFooterBody(
                  skills: state,
                  onRemoveSkill: (skill) {
                    context
                        .read<SelectedLearnSkillsCubit>()
                        .removeSkill(skill);
                  },
                );
              },
            ),

          const SizedBox(height: 20),

          ManageSetupSkillsButton(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}
class CustomFooterBody extends StatelessWidget {
  const CustomFooterBody({
    super.key,
    required this.skills,
    required this.onRemoveSkill,
  });
  final List<String> skills;
  final void Function(String skill) onRemoveSkill;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: skills
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ActiveSkillCard(
                  text: e,
                  widget: GestureDetector(
                    onTap: () {
                      onRemoveSkill(e);
                    },
                    child: Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
