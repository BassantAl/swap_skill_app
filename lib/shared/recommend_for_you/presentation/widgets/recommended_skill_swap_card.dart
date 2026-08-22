import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class RecommendedSkillSwapCard extends StatelessWidget {
  const RecommendedSkillSwapCard({
    super.key,
    required this.title,
    required this.itemColor,
    required this.skills,
  });
  final String title;
  final Color itemColor;
  final List<String> skills;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.medium16(context).copyWith(color: Colors.black),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: ListView.builder(
              itemCount: skills.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right:  8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: itemColor.withAlpha(20),
                      border: Border.all(color: AppColors.smallText.withValues(alpha: 50),width: 0.4),
                    ),
                    child: SizedBox(
                      height: 35,
                      child: Text(
                        skills[index],
                        style: AppStyles.medium14(context),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
