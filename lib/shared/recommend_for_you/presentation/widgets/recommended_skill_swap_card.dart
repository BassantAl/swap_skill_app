import 'package:flutter/material.dart';
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
          style: AppStyles.medium14(context).copyWith(color: itemColor),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 35,
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
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: itemColor),
                    ),
                    child: SizedBox(
                      height: 35,
                      child: Text(
                        skills[index],
                        style: AppStyles.medium16(context),
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
