import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({super.key, required this.onboardingPageModel});
  final OnboardingPageModel onboardingPageModel;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight:  MediaQuery.sizeOf(context).height*0.65,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
      
                fit: BoxFit.contain,
                onboardingPageModel.image,
               
              ),
            ),
          ),
          const SizedBox(height: 50),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              onboardingPageModel.title,
              style: AppStyles.bold28(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              onboardingPageModel.subTitle,
              style: AppStyles.regular16(context),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
