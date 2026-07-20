import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, required this.text,  this.icon});
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary,
      ),
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
