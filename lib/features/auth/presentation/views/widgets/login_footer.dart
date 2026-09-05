import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: AppStyles.medium14(context),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRoutes.signupView);
              },
              child: Text('Sign Up', style: AppStyles.bold14(context)),
            ),
          ),
        ],
      ),
    );
  }
}


