import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/profile_avater.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class PublicProfileHeader extends StatelessWidget {
  const PublicProfileHeader({super.key, required this.user});

  final GetUserInfoModel user;

  @override
  Widget build(BuildContext context) {
    final displayName = user.fullName.trim().isEmpty
        ? 'Swap Skill member'
        : user.fullName.trim();
    final username = user.userName.trim();

    return Column(
      children: [
        ProfileAvater(
          text: displayName,
          width: 104,
          style: AppStyles.bold28(
            context,
          ).copyWith(color: AppColors.primaryPurple),
        ),
        const SizedBox(height: 16),
        Text(
          displayName,
          textAlign: TextAlign.center,
          style: AppStyles.semiBold24(context),
        ),
        if (username.isNotEmpty) ...[
          const SizedBox(height: 5),
          Text(
            '@$username',
            textAlign: TextAlign.center,
            style: AppStyles.medium14(
              context,
            ).copyWith(color: AppColors.lightPurple),
          ),
        ],
        const SizedBox(height: 14),
        Text(
          'Share what you know. Discover what you can learn.',
          textAlign: TextAlign.center,
          style: AppStyles.regular16(context),
        ),
      ],
    );
  }
}
