import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, required this.text, this.icon});
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.medium20(context).copyWith(color: Colors.white),
          ),
          Icon(icon, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
