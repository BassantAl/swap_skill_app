import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({super.key, required this.isActive, });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isActive? 30: 12,
      height: 12,
      decoration: BoxDecoration(color: isActive? AppColors.secondary:Color(0xffC7C4D8) , borderRadius: BorderRadius.circular(16) ),
    );
  }
}
