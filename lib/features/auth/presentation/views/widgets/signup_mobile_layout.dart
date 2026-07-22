import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_signup_form.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/signup_footer.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/signup_header.dart';


class SignupMobileLayout extends StatelessWidget {
  const SignupMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: const Column(
              children: [
                SignupHeader(),
                CustomSignupForm(),
                SizedBox(height: 30,),
                SignupFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
