import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/utils/size_config.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, required this.text, this.icon});
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width >= SizeConfig.tablet ? 650 : null,
      child: CustomButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.medium20(context).copyWith(color: Colors.white),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
