import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class TeachSkillsHeader extends StatelessWidget {
  const TeachSkillsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What Can You Teach?',
          style: AppStyles.bold28(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(
          'Choose the skills you are confident sharing \n with others. This helps us match you with \n eager learners.',
          style: AppStyles.medium16(context),
        ),
      ],
    );
  }
}
