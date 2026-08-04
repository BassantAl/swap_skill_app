import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class InactiveSkillCard extends StatelessWidget {
  const InactiveSkillCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(

        border: Border.all(color: AppColors.neutral.withValues(alpha: 0.15)),
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppStyles.regular18(context).copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
