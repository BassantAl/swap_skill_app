import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ViewProfileButton extends StatelessWidget {
  const ViewProfileButton({super.key, required this.getUserInfoModel, required this.currentUser});
  final GetUserInfoModel getUserInfoModel;
    final GetUserInfoModel currentUser;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 45),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryPurple),
      ),
      onPressed: () {
        GoRouter.of(
          context,
        ).push(AppRoutes.userProfileView,  extra: {
    'user': getUserInfoModel,
    'currentUser': currentUser,
  },);
      },
      child: Text(
        'View Profile',
        style: AppStyles.medium16(context).copyWith(color: Colors.white),
      ),
    );
  }
}
