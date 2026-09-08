import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/auth/presentation/manager/email_verification_cubit/email_verification_cubit.dart';
import 'package:swap_skill/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/email_verification_body.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({
    super.key,
    required this.fullName,
    required this.userName,
  });

  final String fullName;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EmailVerificationCubit()),
        BlocProvider(create: (_) => LogoutCubit()),
      ],
      child: EmailVerificationViewBody(fullName: fullName, userName: userName),
    );
  }
}

class EmailVerificationViewBody extends StatefulWidget {
  const EmailVerificationViewBody({
    super.key,
    required this.fullName,
    required this.userName,
  });

  final String fullName;
  final String userName;

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<EmailVerificationCubit>().checkVerification(
        fullName: widget.fullName,
        userName: widget.userName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailVerificationBody(
        fullName: widget.fullName,
        userName: widget.userName,
      ),
    );
  }
}
