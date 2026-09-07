import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor:color?? AppColors.lightPurple.withAlpha(50),
        color: AppColors.secondary,
      ),
    );
  }
}
