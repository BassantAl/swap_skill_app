import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final repo = getIt<AuthRepo>();

  Future<void> logout() async {
    emit(LogoutLoading());

    final result = await repo.logout();

    result.fold(
      (failure) {
        emit(
          LogoutFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (_) {
        emit(LogoutSuccess());
      },
    );
  }
}