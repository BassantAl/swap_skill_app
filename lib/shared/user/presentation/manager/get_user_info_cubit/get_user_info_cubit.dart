import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/shared/user/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user/data/repos/user_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  final repo = getIt<UserRepo>();

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
       
        emit(GetUserInfoSuccess(getUserInfoModel: result));
      },
    );
  }
}
