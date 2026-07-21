
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Or continue with',
            style: AppStyles.medium14(context).copyWith(color: Colors.black),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
