import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthRepo repo = getIt<AuthRepo>();

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final result = await repo.login(email: email, password: password);

    await result.fold(
      (failure) async {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (_) async {
        try {
          final isVerified = await repo.checkEmailVerification();

          if (isVerified) {
            emit(LoginSuccess());
          } else {
            emit(LoginEmailNotVerified());
          }
        } catch (e) {
          emit(LoginFailure(errorMessage: e.toString()));
        }
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());

    final result = await repo.signInWithGoogle();

    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }
}
