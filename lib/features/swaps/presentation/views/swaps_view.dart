import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/swaps/presentation/views/widgets/skill_swap_request_card.dart';

class SwapsView extends StatelessWidget {
  const SwapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Swaps',style: AppStyles.semiBold24(context),),
        Text('Manage your skill exchange connections',style: AppStyles.medium16(context),),
        SizedBox(height: 20,),
        SkillSwapRequestCard()
      ],
    );
  }
}