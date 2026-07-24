import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  final repo = getIt<AuthRepo>();
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await repo.resetPassword(email: email);

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
