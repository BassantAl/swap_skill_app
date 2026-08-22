import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/user_profile/presentation/views/widgets/profile_action_button.dart';
import 'package:swap_skill/features/user_profile/presentation/views/widgets/public_profile_header.dart';
import 'package:swap_skill/features/user_profile/presentation/views/widgets/user_profile_skill_section.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    super.key,
    required this.getUserInfoModel,
    this.onStartExchange,
    this.onMessage,
  });

  final GetUserInfoModel getUserInfoModel;
  final VoidCallback? onStartExchange;
  final VoidCallback? onMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap Skill', style: AppStyles.bold28(context)),
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                children: [
                  PublicProfileHeader(user: getUserInfoModel),
                  const SizedBox(height: 24),
                  UserSkillsSection(
                    title: 'Skills I Can Teach',
                    skills: getUserInfoModel.teachSkills,
                    color: AppColors.primaryPurple,
                    icon: Icons.school_outlined,
                  ),
                  if (getUserInfoModel.teachSkills.isNotEmpty &&
                      getUserInfoModel.learnSkills.isNotEmpty)
                    const SizedBox(height: 14),
                  UserSkillsSection(
                    title: 'Skills I Want to Learn',
                    skills: getUserInfoModel.learnSkills,
                    color: AppColors.secondary,
                    icon: Icons.auto_stories_outlined,
                  ),
                  if (getUserInfoModel.teachSkills.isNotEmpty &&
                      getUserInfoModel.learnSkills.isNotEmpty) ...[
                
                  ],
                  const SizedBox(height: 28),
                  ProfileActionButtons(
                    onStartExchange: onStartExchange,
                    onMessage: onMessage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

