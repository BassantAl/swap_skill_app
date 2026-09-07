import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  final AuthRepo repo = getIt<AuthRepo>();

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

  Future<void> checkVerification({
    required String fullName,
    required String userName,
  }) async {
    emit(EmailVerificationLoading());

    final isVerified = await repo.checkEmailVerification();

    if (!isVerified) {
      emit(EmailNotVerified());
      return;
    }

    final user = repo.currentUser;

    if (user == null) {
      emit(EmailVerificationFailure(errorMessage: 'User not found'));

      return;
    }

    final result = await repo.createUser(
      uid: user.uid,
      email: user.email ?? '',
      fullName: fullName,
      userName: userName,
    );

    result.fold(
      (failure) {
        emit(EmailVerificationFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(EmailVerified());
      },
    );
  }
}
