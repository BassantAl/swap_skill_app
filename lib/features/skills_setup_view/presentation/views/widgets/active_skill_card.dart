import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class ActiveSkillCard extends StatelessWidget {
  const ActiveSkillCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: AppStyles.regular18(context)),
              const SizedBox(width: 2),
              Icon(Icons.check, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
