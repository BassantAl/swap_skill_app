import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomSkillsHeader extends StatelessWidget {
  const CustomSkillsHeader({
    super.key,
    required this.skillsCount,
    required this.title,
    required this.color,
    required this.icon,
  });

  final int skillsCount;
  final String title;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: AppStyles.semiBold20(context).copyWith(height: 1.2),
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$skillsCount skills',
            style: AppStyles.semibold14(context).copyWith(color: color),
          ),
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}
