import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class LearnTeachUsersSection extends StatelessWidget {
  const LearnTeachUsersSection({
    super.key,
    required this.title,
    required this.itemColor,
  });
  final String title;
  final Color itemColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.medium14(context).copyWith(color: itemColor),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: itemColor)
          ),
          child: Text(
            'Drawing',
            style: AppStyles.medium16(context),
          ),
        ),
      ],
    );
  }
}
