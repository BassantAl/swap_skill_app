import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_confirm_password_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_password_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/terms_and_condition.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';

class CustomSignupForm extends StatefulWidget {
  const CustomSignupForm({super.key});

  @override
  State<CustomSignupForm> createState() => _CustomSignupFormState();
}

class _CustomSignupFormState extends State<CustomSignupForm> {
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter your full name';
              } else {
                return null;
              }
            },
            hintText: 'John Doe',
            title: 'Full Name',
          ),
          const SizedBox(height: 10),
          CustomTextFormFeild(
            hintText: 'johndoe123',
            title: 'Username',
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter your username';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          const CustomEmailTextFeild(),
          const SizedBox(height: 10),
          CustomPasswordTextFeild(passwordController: passwordController),
          const SizedBox(height: 10),
          CustomConfirmPasswordTextFeild(
            passwordController: passwordController,
          ),
          const SizedBox(height: 30),
          const TermsAndCondition(),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                GoRouter.of(context).pushReplacement(AppRoutes.homeView);
              }
            },
            child: CustomNextButton(
              text: 'Create Account',
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
