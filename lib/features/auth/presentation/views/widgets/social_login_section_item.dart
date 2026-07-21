
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class SocialLoginSectionItem extends StatelessWidget {
  const SocialLoginSectionItem({
    super.key, this.child,
  });
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColors.neutral),
        shape: BoxShape.circle),
        child:child ,
    );
  }
}
