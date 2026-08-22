import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/profile_avater.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/view_profile_button.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/recommended_skill_swap_card.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class RecommendedUserItem extends StatelessWidget {
  const RecommendedUserItem({super.key, required this.getUserInfoModel});

  final GetUserInfoModel getUserInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.inputFeildBorderColor.withValues(alpha: 10),
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: const [
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
            contentPadding: EdgeInsets.zero,
            leading: ProfileAvater(
              text: getUserInfoModel.fullName,
              width: 45,
              style: AppStyles.semiBold20(
                context,
              ).copyWith(color: AppColors.primaryPurple),
            ),
            title: Text(
              getUserInfoModel.fullName[0].toUpperCase() +
                  getUserInfoModel.fullName.substring(1),
              style: AppStyles.semiBold20(context),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecommendedSkillSwapCard(
                  skills: getUserInfoModel.teachSkills,
                  title: 'Can teach',
                  itemColor: AppColors.smallText,
                ),

                const SizedBox(height: 12),

                RecommendedSkillSwapCard(
                  skills: getUserInfoModel.learnSkills,
                  title: 'Wants to learn',
                  itemColor: AppColors.smallText,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Divider(thickness: 0.5),
          ),

          ViewProfileButton(getUserInfoModel: getUserInfoModel),
        ],
      ),
    );
  }
}
