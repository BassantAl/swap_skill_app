import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

abstract class AppDecoration {
  static  InputDecoration decorationForTextInputFeild({required BuildContext context,required String hintText }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppStyles.regular16(context),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.inputFeildBorderColor,),
      ),
  
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.secondary,),
      ),
    );
  }
}

