import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/reset_password_mobile_layout.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayoutWidget(
          mobileLayout: (context) => ResetPasswordMobileLayout(),
          tabletLayout: (context) => SizedBox(),
          desktopLayout: (context) => SizedBox(),
        ),
      ),
    );
  }
}
