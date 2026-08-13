
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class BackToLogin extends StatelessWidget {
  const BackToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pushReplacement(AppRoutes.loginView);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.lightPurple,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(
            'Back To Login',
            style: AppStyles.medium18(
              context,
            ).copyWith(color: AppColors.lightPurple),
          ),
        ],
      ),
    );
  }
}
