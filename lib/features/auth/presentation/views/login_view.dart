import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_mobile_lauout_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AdaptiveLayoutWidget(mobileLayout:(context) =>const LoginMobileLauoutWidget(), tabletLayout: (context)=>SizedBox(), desktopLayout: (context)=>SizedBox()),
    );
  }
}
