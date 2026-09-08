import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key, required this.getUserInfoModel});
  final GetUserInfoModel getUserInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [AppColors.lightPurple, AppColors.secondary],
            ).createShader(bounds);
          },
          child: Text(
            'Hello, ${getUserInfoModel.fullName[0].toUpperCase()}${getUserInfoModel.fullName.substring(1)}',
            style: AppStyles.semiBold24(context).copyWith(color: Colors.white),
          ),
        ),

        Text(
          'What do you want to learn today?',
          style: AppStyles.regular16(context),
        ),
      ],
    );
  }
}
