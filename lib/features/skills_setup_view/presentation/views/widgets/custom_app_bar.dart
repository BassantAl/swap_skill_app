import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });
  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back, color: AppColors.primary, size: 22),
        const SizedBox(width: 10),
        Text('Skill Swap', style: AppStyles.bold28(context)),

        Spacer(),

        Column(
          children: [
            Text(
              'STEP $currentPage OF $totalPages',
              style: AppStyles.medium14(context),
            ),
            const SizedBox(height: 3),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 92,
                height: 10,
                child: LinearProgressIndicator(
                  value: currentPage / totalPages,
                  color: AppColors.primary,
                  backgroundColor: const Color(0xFFECECEE),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
