import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {
              
            });
          },
          child: isSelected == false
              ? const Icon(
                  Icons.check_box_outline_blank,
                  color: AppColors.inputFeildBorderColor,
                )
              : const Icon(Icons.check_box, color: AppColors.secondary),
        ),

        const SizedBox(width: 5),
        Text('I agree to the', style: AppStyles.regular16(context)),
        Text(
          'Terms and Conditions',
          style: AppStyles.regular16(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
