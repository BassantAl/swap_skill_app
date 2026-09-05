import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/divider_with_text.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_header.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/social_login_section.dart';

class LoginTabletDesktopLayout extends StatelessWidget {
  const LoginTabletDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 650,
                ),
                child: const Column(
                  children: [
                    LoginHeader(),
                    SizedBox(height: 50),
                    CustomLoginForm(),
                    SizedBox(height: 50),
                    DividerWithText(),
                    SizedBox(height: 50),
                    SocialLoginSection(),
                    SizedBox(height: 50),
                    LoginFooter()
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