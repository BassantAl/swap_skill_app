import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/learn_teach_user_section.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/view_profile_button.dart';

class RecommendedUserItem extends StatelessWidget {
  const RecommendedUserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputFeildBorderColor.withValues(alpha: 10),width: 0.3),
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: SvgPicture.asset(Assets.imagesUserImage),
            title: Text('Bassant', style: AppStyles.semiBold20(context)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: LearnTeachUsersSection(
                    title: 'Can teach',
                    itemColor: AppColors.primaryPurple,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: LearnTeachUsersSection(
                    title: 'Wants to learn',
                    itemColor: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Divider(thickness: 0.5),
          ),
          ViewProfileButton(),
        ],
      ),
    );
  }
}
