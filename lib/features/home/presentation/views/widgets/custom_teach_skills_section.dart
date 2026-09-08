import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/custom_skills_header.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/custom_skills_list.dart';

class CustomTeachSkillsSection extends StatelessWidget {
  const CustomTeachSkillsSection({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFEEEEEE),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSkillsHeader(
              icon: const FaIcon(
                FontAwesomeIcons.chalkboardUser,
                size: 20,
                color: AppColors.secondary,
              ),
              color: AppColors.secondary,
              title: 'Skills I Can\nTeach',
              skillsCount: items.length,
            ),

            const SizedBox(height: 16),

            CustomSkillsList(
              items: items,
              color: AppColors.secondary,
              isTeach: true,
            ),
          ],
        ),
      ),
    );
  }
}