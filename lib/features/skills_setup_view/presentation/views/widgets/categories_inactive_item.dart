import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';

class CategoriesInactiveItem extends StatelessWidget {
  const CategoriesInactiveItem({super.key, required this.categoriesModel});
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        border: BoxBorder.all(color: AppColors.neutral.withValues(alpha: 0.5)),
      ),

      child: Center(
        child: Text(
          categoriesModel.name,
          style: AppStyles.medium18(context).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
