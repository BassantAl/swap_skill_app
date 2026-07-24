import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

class CustomSendResetLinkButton extends StatelessWidget {
  const CustomSendResetLinkButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: state is ResetPasswordLoading?null: onTap,
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is ResetPasswordLoading
                    ? CustomLoadingIndicator()
                    : Text(
                        'Send Reset Link',
                        style: AppStyles.medium20(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                const SizedBox(width: 5),
                Transform.rotate(
                  angle: 3.141592653589793,
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 19),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
