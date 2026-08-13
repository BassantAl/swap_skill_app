import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/skill_card.dart';

class CustomTeachSkillsSection extends StatelessWidget {
  const CustomTeachSkillsSection({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills I Can Teach', style: AppStyles.semiBold20(context)),
        const SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SkillCard(
                        color: AppColors.neutral.withAlpha(30),
                        text: items[index],
                      ),
                    );
                  },
                ),
              ),
              SkillCard(
                icon: Icons.add,
                color: Color.fromARGB(255, 255, 255, 255),
                text: 'Add Skill',
              ),
            ],
          ),
        ),
      ],
    );
  }
}


