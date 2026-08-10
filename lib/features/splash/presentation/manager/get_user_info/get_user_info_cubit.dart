import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  final repo = getIt<SplashRepo>();

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoading());
    var result = await repo.getUserInfo();
    result.fold(
      (failure) {
         log('GET USER INFO FAILURE: ${failure.errorMessage}');
        emit(GetUserInfoFailure(errorMessage: failure.errorMessage));
      },
      (result) {
         log('GET USER INFO SUCCESS: $result');
        if (result == null) {
          emit(GetUserInfoFailure(errorMessage: 'User information not found'));
          return;
        }
        emit(GetUserInfoSuccess(userInfo: result));
      },
    );
  }
}
