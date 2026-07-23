import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final repo = getIt<AuthRepo>();
  void signup({required String email, required String password,required String fullName,required String userName}) async {
    emit(SignupLoading());
    var result = await repo.signup(email: email, password: password,fullName:fullName,userName:userName  );
    result.fold(
      (failure) {
        emit(SignupFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(SignupSuccess());
      },
    );
  }
}
