import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/auth/presentation/manager/email_verification_cubit/email_verification_cubit.dart';
import 'package:swap_skill/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/email_verification_body.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EmailVerificationCubit()),
        BlocProvider(create: (_) => LogoutCubit()),
      ],
      child: const EmailVerificationViewBody(),
    );
  }
}

class EmailVerificationViewBody extends StatefulWidget {
  const EmailVerificationViewBody({super.key});

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody>
    with WidgetsBindingObserver {
  Timer? verificationTimer;
  @override
  void initState() {
    super.initState();
    startVerificationTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  void startVerificationTimer() {
    verificationTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      context.read<EmailVerificationCubit>().checkVerification();
    });
  }

  @override
  void dispose() {
    verificationTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<EmailVerificationCubit>().checkVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EmailVerificationBody());
  }
}
