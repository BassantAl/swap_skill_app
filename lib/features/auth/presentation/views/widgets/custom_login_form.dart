import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_password_text_feild.dart';


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
      listener: (context, state) {
        if (state is LoginSuccess) {
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
              const SizedBox(height: 10),
              CustomPasswordTextFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppStyles.bold14(context),
                  ),
                ),
              ),
              GestureDetector(
                onTap: state is LoginLoading?null: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<LoginCubit>(
                      context,
                    ).login(email: email, password: password);
                  }
                },
                child:  CustomButton(child:state is LoginLoading? const CustomLoadingIndicator() :Text(
                    'Login',
                    style: AppStyles.medium20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),),
              ),
            ],
          ),
        );
      },
    );
  }
}
