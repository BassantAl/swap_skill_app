import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/divider_with_text.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_header.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/social_login_section.dart';

class LoginMobileLauoutWidget extends StatelessWidget {
  const LoginMobileLauoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: const Column(
              children: [
                LoginHeader(),
                SizedBox(height: 30),
                CustomLoginForm(),
                SizedBox(height: 30),
                DividerWithText(),
                SizedBox(height: 30),
                SocialLoginSection(),
                SizedBox(height: 30),
                LoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
