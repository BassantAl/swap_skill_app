
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          GoRouter.of(
            context,
          ).pushReplacement(AppRoutes.resetPasswordView);
        },
        child: Text(
          'Forgot Password?',
          style: AppStyles.bold14(context),
        ),
      ),
    );
  }
}
