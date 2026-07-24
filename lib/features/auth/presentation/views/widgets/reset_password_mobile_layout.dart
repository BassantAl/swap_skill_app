import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';

class ResetPasswordMobileLayout extends StatelessWidget {
  const ResetPasswordMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reset Password',
            style: AppStyles.bold28(context).copyWith(color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            'Enter your email address and we\'ll send \nyou a password reset link.',
            style: AppStyles.medium20(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomEmailTextFeild(),
          const SizedBox(height: 30),
          CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Send Reset Link',
                  style: AppStyles.medium20(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                const SizedBox(width: 5),
                Transform.rotate(
                  angle: 3.141592653589793,
                  child: Icon(Icons.arrow_back, color: Colors.white,size: 19,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.loginView);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_sharp, color: AppColors.primary,size: 14,),
                const SizedBox(width: 5),
                Text(
                  'Back To Login',
                  style: AppStyles.medium18(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
