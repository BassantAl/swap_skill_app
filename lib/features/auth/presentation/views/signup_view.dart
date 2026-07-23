import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/signup_mobile_layout.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        body: AdaptiveLayoutWidget(
          mobileLayout: (context) => SignupMobileLayout(),
          tabletLayout: (context) => SizedBox(),
          desktopLayout: (context) => SizedBox(),
        ),
      ),
    );
  }
}
