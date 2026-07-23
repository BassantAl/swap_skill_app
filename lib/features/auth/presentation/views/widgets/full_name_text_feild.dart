
import 'package:flutter/material.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class FullnameTextFeild extends StatelessWidget {
  const FullnameTextFeild({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter your full name';
        } else {
          return null;
        }
      },
      hintText: 'John Doe',
      title: 'Full Name',
    );
  }
}
