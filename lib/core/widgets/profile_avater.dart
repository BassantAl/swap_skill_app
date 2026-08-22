import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class ProfileAvater extends StatelessWidget {
  const ProfileAvater({super.key, required this.text, this.width, this.style});
  final String text;
  final double? width;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    final initials = text
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0].toUpperCase())
        .join();
    return Container(
      width: width,
      height: 104,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryPurple.withValues(alpha: 0.12),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.22),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          initials.isEmpty ? '?' : initials,
          style:style
        ),
      ),
    );
  }
}
