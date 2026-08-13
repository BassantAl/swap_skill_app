
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
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(12),
        color: itemColor.withAlpha(15),
        border: Border.all(color: itemColor.withAlpha(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.medium14(context)),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: itemColor.withAlpha(40),
              
            ),
            child: Text(
              ' Drawing',
              style: AppStyles.medium16(context).copyWith(color: itemColor),
            ),
          ),
        ],
      ),
    );
  }
}
