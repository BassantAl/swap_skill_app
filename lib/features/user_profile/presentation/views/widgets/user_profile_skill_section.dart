import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/user_profile/presentation/views/widgets/skill_chip.dart';
import 'package:swap_skill/features/user_profile/presentation/views/widgets/user_profile_section_card.dart';

class UserSkillsSection extends StatelessWidget {
  const UserSkillsSection({
    super.key,
    required this.title,
    required this.skills,
    required this.color,
    required this.icon,
  });

  final String title;
  final List<String> skills;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 9),
              Expanded(
                child: Text(title, style: AppStyles.semiBold20(context)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => SkillChip(label: skill, color: color))
                .toList(),
          ),
        ],
      ),
    );
  }
}
