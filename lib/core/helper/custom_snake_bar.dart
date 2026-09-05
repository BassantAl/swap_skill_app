import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';

void customSnakeBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.secondary,
      content: CustomErrorWidget(errorMessage: message),
    ),
  );
}
