import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class ProfileSectionCard extends StatelessWidget {
  const ProfileSectionCard({
    super.key,
    required this.child,
    this.color = Colors.white,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.inputFeildBorderColor.withValues(alpha: 0.45),
        ),
      ),
      child: child,
    );
  }
}