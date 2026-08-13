import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.text, this.color, this.icon});
  final String text;
  final Color? color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral.withValues(alpha: 0.15)),
        borderRadius: BorderRadius.circular(32),
        color: color,
      ),
      child: Center(
        child:icon==null?FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                text.trim(),
                style: AppStyles.regular16(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ): Row(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                text.trim(),
                style: AppStyles.regular16(
                  context,
                ).copyWith(color: AppColors.lightPurple),
              ),
            ),
            Icon(icon,size: 20,color: AppColors.lightPurple,),
          ],
        ),
      ),
    );
  }
}
