import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: AppStyles.medium14(context),
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRoutes.loginView);
                },
                child: Text('Login', style: AppStyles.bold14(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

