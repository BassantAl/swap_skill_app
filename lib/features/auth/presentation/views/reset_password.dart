import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/reset_password_mobile_layout.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/reset_password_tablet_desktop_layout.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: AdaptiveLayoutWidget(
              mobileLayout: (context) => const ResetPasswordMobileLayout(),
              tabletLayout: (context) => const ResetPasswordTabletDesktopLayout(),
              desktopLayout: (context) => const ResetPasswordTabletDesktopLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
