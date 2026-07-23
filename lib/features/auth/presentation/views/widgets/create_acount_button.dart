import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';

class CreateAcountButton extends StatelessWidget {
  const CreateAcountButton({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
    required this.fullName,
    required this.userName,
  });

  final GlobalKey<FormState> formKey;
  final String email;
  final String password;
  final String fullName;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return GestureDetector(
          onTap:state is SignupLoading?null: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<SignupCubit>(context).signup(
                email: email,
                password: password,
                fullName: fullName,
                userName: userName,
              );
            }
          },
          child: CustomButton(
            child: state is SignupLoading
                ? const CustomLoadingIndicator()
                : Text(
                    'Create Account',
                    style: AppStyles.medium20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
          ),
        );
      },
    );
  }
}
