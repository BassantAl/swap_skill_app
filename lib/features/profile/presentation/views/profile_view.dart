import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_skills.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/profile_setting.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomProfileImage(),
          SizedBox(height: 15),
          Text('Bassant', style: AppStyles.semiBold20(context)),
          const SizedBox(height: 15),
          const CustomProfileSkills(),
          const SizedBox(height: 20),
      const ProfileSettings()
         
        ],
      ),
    );
  }
}
