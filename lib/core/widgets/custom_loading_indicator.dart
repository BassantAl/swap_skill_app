import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
       color: AppColors.primary,
       backgroundColor: AppColors.secondary.withAlpha(50),
              ),
    );
  }
}
