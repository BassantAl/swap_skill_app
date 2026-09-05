import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/back_to_login.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/cusrom_dend_reset_link_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/reset_password_header.dart';

class ResetPasswordTabletDesktopLayout extends StatefulWidget {
  const ResetPasswordTabletDesktopLayout({super.key});

  @override
  State<ResetPasswordTabletDesktopLayout> createState() => _ResetPasswordTabletDesktopLayoutState();
}

class _ResetPasswordTabletDesktopLayoutState extends State<ResetPasswordTabletDesktopLayout> {
    String email = '';
  @override
  Widget build(BuildContext context) {
      return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if(state is ResetPasswordFailure){
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.secondary,
              content: CustomErrorWidget(errorMessage: state.errorMessage),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 650
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ResetPasswordHeader(),
                  const SizedBox(height: 20),
                  CustomEmailTextFeild(
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomSendResetLinkButton(
                    onTap: () {
                      BlocProvider.of<ResetPasswordCubit>(
                        context,
                      ).resetPassword(email: email);
                    },
                  ),
                  const SizedBox(height: 30),
                  const BackToLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}