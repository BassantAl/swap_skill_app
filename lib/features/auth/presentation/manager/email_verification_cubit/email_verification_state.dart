part of 'email_verification_cubit.dart';

@immutable
sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationSent extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationFailure extends EmailVerificationState {
  final String errorMessage;
  EmailVerificationFailure({required this.errorMessage});
}

final class EmailVerified extends EmailVerificationState {}

final class EmailNotVerified extends EmailVerificationState {}
