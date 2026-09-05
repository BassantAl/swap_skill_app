import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            'Create Account',
            style: AppStyles.bold28(context).copyWith(color: Color(0xff1A1B22)),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            'Join the community and start exchanging \nskills.',
            style: AppStyles.regular16(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
