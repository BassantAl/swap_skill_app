import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final AuthRepo repo = getIt<AuthRepo>();

  Future<void> signup({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  }) async {
    emit(SignupLoading());

    final signupResult = await repo.signup(
      email: email,
      password: password,
    );

    await signupResult.fold(
      (failure) async {
        emit(
          SignupFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (_) async {
        final verificationResult =
            await repo.sendEmailVerification();

        verificationResult.fold(
          (failure) {
            emit(
              SignupFailure(
                errorMessage: failure.errorMessage,
              ),
            );
          },
          (_) {
            emit(
              SignupSuccess(
                fullName: fullName,
                userName: userName,
              ),
            );
          },
        );
      },
    );
  }
}