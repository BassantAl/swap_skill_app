import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/core/services/pending_user_service.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  final AuthRepo repo = getIt<AuthRepo>();

  final PendingUserService pendingUserService = getIt<PendingUserService>();

  Future<void> sendVerificationEmail() async {
    emit(EmailVerificationLoading());

    final result = await repo.sendEmailVerification();

    result.fold(
      (failure) {
        emit(EmailVerificationFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(EmailVerificationSent());
      },
    );
  }

  Future<void> checkVerification() async {
    emit(EmailVerificationLoading());

    try {
      final user = repo.currentUser;

      if (user == null) {
        emit(EmailVerificationFailure(errorMessage: 'User not found.'));
        return;
      }

      final isVerified = await repo.checkEmailVerification();

      if (!isVerified) {
        emit(EmailNotVerified());
        return;
      }

      final pendingUser = pendingUserService.getPendingUser();

      if (pendingUser == null) {
        emit(
          EmailVerificationFailure(
            errorMessage: 'Pending user information not found.',
          ),
        );
        return;
      }

      final pendingUid = pendingUser['uid'] as String?;

      final pendingEmail = pendingUser['email'] as String?;

      if (pendingUid == null || pendingEmail == null) {
        emit(
          EmailVerificationFailure(
            errorMessage: 'Invalid pending user information.',
          ),
        );
        return;
      }

      if (pendingUid != user.uid) {
        emit(
          EmailVerificationFailure(
            errorMessage: 'User information does not match this account.',
          ),
        );
        return;
      }

      if (pendingEmail != user.email) {
        emit(
          EmailVerificationFailure(
            errorMessage: 'Email does not match this account.',
          ),
        );
        return;
      }

      final result = await repo.createUser(
        uid: user.uid,
        email: pendingEmail,
        fullName: pendingUser['fullName'] as String,
        userName: pendingUser['userName'] as String,
      );

      result.fold(
        (failure) {
          emit(EmailVerificationFailure(errorMessage: failure.errorMessage));
        },
        (_) async {
          await pendingUserService.clearPendingUser();

          emit(EmailVerified());
        },
      );
    } catch (e) {
      emit(EmailVerificationFailure(errorMessage: e.toString()));
    }
  }
}
