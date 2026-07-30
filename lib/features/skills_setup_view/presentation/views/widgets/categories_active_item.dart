import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CategoriesActiveItem extends StatelessWidget {
  const CategoriesActiveItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(text, style: AppStyles.medium18(context)),
      ),
    );
  }
}
