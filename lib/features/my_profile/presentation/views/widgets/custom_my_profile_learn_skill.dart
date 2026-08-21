import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomMyProfileLearnSkill extends StatelessWidget {
  const CustomMyProfileLearnSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.bookOpen, size: 15, color: AppColors.secondary),
        SizedBox(width: 8),
        Text(
          'I Want To Learn',
          style: AppStyles.medium18(context).copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
