
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRoutes.loginView);
        },
        child: Text(
          'skip',
          style: AppStyles.regular16(context).copyWith(
            decoration: TextDecoration.underline,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
