import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/terms_and_condition.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';

class CustomSignupForm extends StatelessWidget {
  const CustomSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormFeild(hintText: 'John Doe', title: 'Full Name'),
          const SizedBox(height: 10),
          CustomTextFormFeild(hintText: 'johndoe123', title: 'Username'),
          const SizedBox(height: 10),
          CustomTextFormFeild(hintText: 'name@example.com', title: 'Email'),
          const SizedBox(height: 10),
          CustomTextFormFeild(hintText: '********', title: 'Password'),
          const SizedBox(height: 10),
          CustomTextFormFeild(hintText: '********', title: 'Confirm Password'),
          const SizedBox(height: 30),
          const TermsAndCondition(),
          const SizedBox(height: 30,),
          CustomNextButton(text: 'Create Account', icon: Icons.arrow_forward),
          
        ],
      ),
    );
  }
}
