import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.onboardingPageModel,
  });

  final OnboardingPageModel onboardingPageModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
      
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 380,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  onboardingPageModel.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
      
            const SizedBox(height: 20),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                onboardingPageModel.title,
                style: AppStyles.bold28(context),
                textAlign: TextAlign.center,
              ),
            ),
      
            const SizedBox(height: 10),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                onboardingPageModel.subTitle,
                style: AppStyles.regular16(context),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}