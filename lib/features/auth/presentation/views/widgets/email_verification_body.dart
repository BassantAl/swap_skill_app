import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/helper/custom_snake_bar.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/auth/presentation/manager/email_verification_cubit/email_verification_cubit.dart';
import 'package:swap_skill/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: MultiBlocListener(
            listeners: [
              BlocListener<EmailVerificationCubit, EmailVerificationState>(
                listener: (context, state) {
                  if (state is EmailVerificationSent) {
                    customSnakeBar(
                      context: context,
                      message: 'Verification email sent successfully',
                    );
                  } else if (state is EmailVerificationFailure) {
                    customSnakeBar(
                      context: context,
                      message: state.errorMessage,
                    );
                  } else if (state is EmailVerified) {
                    context.go(AppRoutes.skillsSetupView);
                  } else if (state is EmailNotVerified) {
                    customSnakeBar(
                      context: context,
                      message: 'Please verify your email first',
                    );
                  }
                },
              ),

              BlocListener<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state is LogoutSuccess) {
                    context.go(AppRoutes.loginView);
                  } else if (state is LogoutFailure) {
                    customSnakeBar(
                      context: context,
                      message: state.errorMessage,
                    );
                  }
                },
              ),
            ],
            child: BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
              builder: (context, verificationState) {
                return BlocBuilder<LogoutCubit, LogoutState>(
                  builder: (context, logoutState) {
                    final isLoading =
                        verificationState is EmailVerificationLoading ||
                        logoutState is LogoutLoading;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.mark_email_unread_outlined, size: 100),

                        const SizedBox(height: 30),

                        Text(
                          'Verify Your Email',
                          textAlign: TextAlign.center,
                          style: AppStyles.bold28(
                            context,
                          ).copyWith(color: Colors.black),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'We sent a verification link to your email. '
                          'Please check your inbox and click the link '
                          'to verify your email address.',
                          textAlign: TextAlign.center,
                          style: AppStyles.medium14(context),
                        ),

                        const SizedBox(height: 20),

                        if (isLoading)
                          const SizedBox(
                            height: 24,
                            width: 24,
                            child: CustomLoadingIndicator(),
                          ),

                        const SizedBox(height: 20),

                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  context
                                      .read<EmailVerificationCubit>()
                                      .sendVerificationEmail();
                                },
                          child: Text(
                            'Resend Verification Email',
                            style: AppStyles.medium20(
                              context,
                            ).copyWith(color: AppColors.lightPurple),
                          ),
                        ),

                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  context.read<LogoutCubit>().logout();
                                },
                          child: Text(
                            'Back to Login',
                            style: AppStyles.medium20(
                              context,
                            ).copyWith(color: AppColors.lightPurple),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
