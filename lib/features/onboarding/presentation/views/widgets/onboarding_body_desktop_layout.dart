import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/features/onboarding/data/models/onboarding_page_model.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/onboarding_page_item.dart';

class OnboardingBodyDesktopLayout extends StatelessWidget {
  const OnboardingBodyDesktopLayout({super.key, required this.items});
final List<OnboardingPageModel> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map(
                (e)=>Padding(
                  padding: const EdgeInsets.only (right:  16.0),
                  child: OnboardingPageItem(onboardingPageModel: e),
                )
              ).toList()
            ),
        
            SizedBox(height: 35,),
            GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRoutes.skillsSetupView);
          },
          child: CustomNextButton(text: 'Get Started'),
        ),
        SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
