import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/skills_details_body.dart';

class SkillDetailsView extends StatelessWidget {
  const SkillDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AdaptiveLayoutWidget(mobileLayout: (context)=>SkillsDetailsBody(), tabletLayout: (context)=>SizedBox(), desktopLayout: (context)=>SizedBox())),
    );
  }
}