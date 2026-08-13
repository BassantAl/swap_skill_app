import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/recommended_user_item.dart';

class RecommendForYouSection extends StatelessWidget {
  const RecommendForYouSection({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('Recommended for You', style: AppStyles.semiBold24(context)),
        const SizedBox(height: 10),
        RecommendedUserItem(),
      ],
    );
  }
}
