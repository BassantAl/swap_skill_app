
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.title, this.validator, this.obscureText, this.suffixIcon, this.controller,
  });
  final String hintText;
  final String title;
  final String? Function(String?)? validator;
final bool? obscureText;
final Widget? suffixIcon;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.medium14(context)),
        TextFormField(
          controller:controller ,
          obscureText:obscureText??false ,
          validator: validator,
          decoration: AppDecoration.decorationForTextInputFeild(
            suffixIcon:suffixIcon ,
            context: context,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
