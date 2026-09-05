import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              'Reset Password',
              style: AppStyles.bold28(context).copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 15),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              'Enter your email address and we\'ll send \nyou a password reset link.',
              style: AppStyles.medium20(context),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}