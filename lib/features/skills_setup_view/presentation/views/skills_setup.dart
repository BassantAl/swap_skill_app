import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills_mobile_layout.dart';

class SkillsSetup extends StatelessWidget {
  const SkillsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayoutWidget(
      mobileLayout: (context) => TeachSkillsMobileLayout(),
      tabletLayout: (context) => SizedBox(),
      desktopLayout: (context) => SizedBox(),
              ),
    );
  }
}

  // CircleAvatar(
              //   backgroundColor: AppColors.neutral,
              //   radius: 23,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(60),
                  
              //     child: Image.asset(Assets.imagesAppLogo2, width: 45),
              //   ),
              // ),