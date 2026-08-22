import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Text(
        label.trim(),
        style: AppStyles.medium14(context).copyWith(color: color),
      ),
    );
  }
}