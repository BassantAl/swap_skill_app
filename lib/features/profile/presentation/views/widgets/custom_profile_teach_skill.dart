import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomProfileTeachSkill extends StatelessWidget {
  const CustomProfileTeachSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.chalkboardUser,
          size: 15,
          color: AppColors.primaryPurple,
        ),
        SizedBox(width: 8),
        Text(
          'I Can Teach',
          style: AppStyles.medium18(context).copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
