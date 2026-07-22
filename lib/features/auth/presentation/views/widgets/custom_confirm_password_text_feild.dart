import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class CustomConfirmPasswordTextFeild extends StatefulWidget {
  const CustomConfirmPasswordTextFeild({super.key, this.passwordController});
final  TextEditingController? passwordController;
  @override
  State<CustomConfirmPasswordTextFeild> createState() =>
      _CustomConfirmPasswordTextFeildState();
}

class _CustomConfirmPasswordTextFeildState
    extends State<CustomConfirmPasswordTextFeild> {
  bool obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Icon(Icons.visibility, color: AppColors.neutral),
      ),
      obscureText: obscureText,
      validator: (value) {
       if (value == null || value.isEmpty) {
    return 'Please confirm your password.';
  }

  if (value != widget.passwordController!.text) {
    return 'Passwords do not match.';
  }

  return null;
      },
      title: 'Confirm Password',
      hintText: '********',
    );
  }
}
