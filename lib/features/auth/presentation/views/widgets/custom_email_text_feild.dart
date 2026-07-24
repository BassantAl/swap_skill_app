
import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class CustomEmailTextFeild extends StatelessWidget {
  const CustomEmailTextFeild({
    super.key, this.onSaved, this.onChanged,
  });
final Function(String?)? onSaved;
final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      onChanged: onChanged,
      onSaved:onSaved ,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter your email.';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      title: 'Email Address',
      hintText: 'name@example.com',
    );
  }
}
