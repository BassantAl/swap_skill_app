import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_signup_form.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/signup_footer.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/signup_header.dart';

class SignupTabletDesktopLayout extends StatelessWidget {
  const SignupTabletDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 650,
              ),
              child: Center(
                child: const Column(
                  children: [
                    SignupHeader(),
                    CustomSignupForm(),
                    SizedBox(height: 50,),
                    SignupFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}