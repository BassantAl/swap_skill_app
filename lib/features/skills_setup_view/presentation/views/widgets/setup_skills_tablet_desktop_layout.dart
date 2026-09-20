import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skills_want_to_learn.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills.dart';

class SetupSkillsTabletDesktopLayout extends StatelessWidget {
  const SetupSkillsTabletDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: TeachSkills()), Expanded(child: SkillsWantToLearn())]);
  }
}
