import 'package:flutter/material.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),
         Center(
          child: Image.asset(Assets.imagesAppLogo2, width: 120, height: 120),
        ),
        const SizedBox(height: 24),
         Container(
          padding:const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: const Color(0xffFFFFFF)),
          child: Text('Swap Skill', style: AppStyles.bold38(context)),
        ),
        const SizedBox(height: 8),
         Text('Learn. Teach. Grow Together.', style: AppStyles.medium20(context)),

         Expanded(
           child: CustomLoadingIndicator(),
         ),
        
      ],
    );
  }
}

