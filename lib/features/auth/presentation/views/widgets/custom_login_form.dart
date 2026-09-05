import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_password_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
          if (!context.mounted) return;
          GoRouter.of(context).pushReplacement(AppRoutes.homeView);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.secondary,
              content: CustomErrorWidget(errorMessage: state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomEmailTextFeild(
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 20),
              CustomPasswordTextFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 10),
              const CustomTextButton(),
              CustomLoginButtton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await BlocProvider.of<LoginCubit>(
                      context,
                    ).login(email: email, password: password);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
