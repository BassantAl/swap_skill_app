import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class CustomLoginButtton extends StatelessWidget {
  const CustomLoginButtton({
    super.key,
    this.onTap,
  });


  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: state is LoginLoading
              ? null
              : onTap,
          child: CustomButton(
            child: state is LoginLoading
                ? const CustomLoadingIndicator()
                : Text(
                    'Login',
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
