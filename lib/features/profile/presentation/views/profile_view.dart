import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/custom_profile_skills.dart';
import 'package:swap_skill/features/profile/presentation/views/widgets/profile_setting.dart';
import 'package:swap_skill/shared/user/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
          if (state is GetUserInfoSuccess) {
            return Column(
              children: [
                CustomProfileImage(),
                SizedBox(height: 15),
                Text(
                  state.getUserInfoModel.fullName[0].toUpperCase() +
                      state.getUserInfoModel.fullName.substring(1),
                  style: AppStyles.semiBold20(context),
                ),
                const SizedBox(height: 15),
                CustomProfileSkills(
                  teachSkills: state.getUserInfoModel.teachSkills,
                  learnSkills: state.getUserInfoModel.learnSkills,
                ),
                const SizedBox(height: 20),
                const ProfileSettings(),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
