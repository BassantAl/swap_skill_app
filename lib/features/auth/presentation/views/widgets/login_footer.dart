import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: AppStyles.medium14(context)),
        Text('Sign Up',style: AppStyles.bold14(context),)
      ],
    );
  }
}
