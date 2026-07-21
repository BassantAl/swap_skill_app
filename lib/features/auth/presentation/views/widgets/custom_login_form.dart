import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please write your email';
              } else {
                return null;
              }
            },
            title: 'Email Address',
            hintText: 'alex@example.com',
          ),
          const SizedBox(height: 10),
          CustomTextFormFeild(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password.';
              } else {
                return null;
              }
            },
            title: 'Password',
            hintText: '********',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Forgot Password?', style: AppStyles.bold14(context)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                GoRouter.of(context).pushReplacement(AppRoutes.homeView);
              }
            },
            child: const CustomNextButton(text: 'Login'),
          ),
        ],
      ),
    );
  }
}
