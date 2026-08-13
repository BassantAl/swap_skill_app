import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/active_skill_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/inactive_skill_card.dart';

class ManageSkillCardState extends StatelessWidget {
  const ManageSkillCardState({super.key, required this.isActive, required this.text});
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return isActive ? ActiveSkillCard(text: text,widget:  Icon(Icons.check, color: Colors.white, size: 16),) : InactiveSkillCard(text: text,);
  }
}
