import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/create_acount_button.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_confirm_password_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/custom_password_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/full_name_text_feild.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/terms_and_condition.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/user_name_text_feild.dart';

class CustomSignupForm extends StatefulWidget {
  const CustomSignupForm({super.key});

  @override
  State<CustomSignupForm> createState() => _CustomSignupFormState();
}

class _CustomSignupFormState extends State<CustomSignupForm> {
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey();
   String email='' ;
   String password='' ;
   String userName ='';
   String fullName='' ;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.homeView);
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(
            // padding: EdgeInsets.all(8),
            backgroundColor: AppColors.secondary,
            content: CustomErrorWidget(errorMessage: state.errorMessage)));
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FullnameTextFeild(
              onSaved: (value) {
                fullName = value!;
              },
            ),
            const SizedBox(height: 10),
            UserNameTextFeild(
              onSaved: (value) {
                userName = value!;
              },
            ),
            const SizedBox(height: 10),
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
              passwordController: passwordController,
            ),
            const SizedBox(height: 10),
            CustomConfirmPasswordTextFeild(
              passwordController: passwordController,
            ),
            const SizedBox(height: 30),
            const TermsAndCondition(),
            const SizedBox(height: 30),
            CreateAcountButton(
              fullName: fullName,
              userName: userName,
              formKey: formKey,
              email: email,
              password: password,
            ),
          ],
        ),
      ),
    );
  }
}
