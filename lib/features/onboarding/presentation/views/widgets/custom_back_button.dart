import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.text,});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, color: Colors.black, size: 20),
          Text(
            text,
            style: AppStyles.medium20(context).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
