import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillsHeader extends StatelessWidget {
  const SkillsHeader({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.bold28(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(
          subTitle,
          style: AppStyles.medium16(context),
        ),
      ],
    );
  }
}
