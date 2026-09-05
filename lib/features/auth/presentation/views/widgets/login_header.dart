import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            'Welcome Back',
            style: AppStyles.bold28(context).copyWith(color: Color(0xff1A1B22)),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            'Sign in to continue exchanging skills and \n learning with the community.',
            style: AppStyles.regular16(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
