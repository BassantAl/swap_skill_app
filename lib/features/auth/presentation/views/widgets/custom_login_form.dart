import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/helper/custom_snake_bar.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_password_text_feild.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          final learnSkills = state.getUserInfoModel.learnSkills;
          final teachSkills = state.getUserInfoModel.teachSkills;

          final hasSkills = learnSkills.isNotEmpty && teachSkills.isNotEmpty;

          if (hasSkills) {
            context.go(AppRoutes.homeView);
          } else {
            context.go(AppRoutes.skillsSetupView);
          }
        }

        if (state is GetUserInfoFailure) {
          context.go(AppRoutes.skillsSetupView);
        }
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginEmailNotVerified) {
            context.push(AppRoutes.emailVerificationView);
          }

          if (state is LoginSuccess) {
            context.read<GetUserInfoCubit>().getUserInfo();
          }

          if (state is LoginFailure) {
            customSnakeBar(context: context, message: state.errorMessage);
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

                      await context.read<LoginCubit>().login(
                        email: email,
                        password: password,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
