import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/my_profile/presentation/views/widgets/custom_my_profile_image.dart';
import 'package:swap_skill/features/my_profile/presentation/views/widgets/custom_my_profile_skills.dart';
import 'package:swap_skill/features/my_profile/presentation/views/widgets/my_profile_setting.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
          if (state is GetUserInfoSuccess) {
            return Column(
              children: [
                CustomMyProfileImage(),
                SizedBox(height: 15),
                Text(
                  state.getUserInfoModel.fullName[0].toUpperCase() +
                      state.getUserInfoModel.fullName.substring(1),
                  style: AppStyles.semiBold20(context),
                ),
                const SizedBox(height: 15),
                CustomMyProfileSkills(
                  teachSkills: state.getUserInfoModel.teachSkills,
                  learnSkills: state.getUserInfoModel.learnSkills,
                ),
                const SizedBox(height: 20),
                const MyProfileSetting(),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
