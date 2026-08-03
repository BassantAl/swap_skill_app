import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class InactiveSkillCard extends StatelessWidget {
  const InactiveSkillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.15)),
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 255, 255, 255)
      ) ,
      child: Center(child: Text('flutter',style: AppStyles.regular18(context).copyWith(color: Colors.black),)),
    );
  }
}