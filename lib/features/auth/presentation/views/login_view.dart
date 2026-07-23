import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/login_mobile_lauout_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: AdaptiveLayoutWidget(
          mobileLayout: (context) => const LoginMobileLauoutWidget(),
          tabletLayout: (context) => SizedBox(),
          desktopLayout: (context) => SizedBox(),
        ),
      ),
    );
  }
}
