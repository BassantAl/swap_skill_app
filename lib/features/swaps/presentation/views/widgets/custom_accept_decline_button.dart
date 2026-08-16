
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomAcceptDeclineButton extends StatelessWidget {
  const CustomAcceptDeclineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.primaryPurple,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Accept',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xffE3E1EC),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Decline',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

