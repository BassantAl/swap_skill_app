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

  void addTeachSkillLocally(String skill) {
    if (state is! GetUserInfoSuccess) {
      return;
    }
    final currentState = state as GetUserInfoSuccess;
    final currentModel = currentState.getUserInfoModel;

  if (currentModel.teachSkills.contains(skill)) {
    return;
  }

    final updatedModel = currentModel.copyWith(
      teachSkills: [
        ...currentModel.teachSkills,
        skill,
      ],
    );
    emit(GetUserInfoSuccess(getUserInfoModel: updatedModel));
  }

  void addLearnSkillLocally(String skill) {
    if (state is! GetUserInfoSuccess) {
      return;
    }
    final currentState = state as GetUserInfoSuccess;
    final currentModel = currentState.getUserInfoModel;

  if (currentModel.teachSkills.contains(skill)) {
    return;
  }
    final updatedModel = currentModel.copyWith(
      learnSkills: [
        ...currentModel.learnSkills,
        skill,
      ],
    );
    emit(GetUserInfoSuccess(getUserInfoModel: updatedModel));
  }



 void removeTeachSkillLocally(String skill) {
  if (state is! GetUserInfoSuccess) {
    return;
  }

  final currentState = state as GetUserInfoSuccess;
  final currentModel = currentState.getUserInfoModel;

  final updatedTeachSkills = List<String>.from(
    currentModel.teachSkills,
  );

  updatedTeachSkills.remove(skill);

  final updatedModel = currentModel.copyWith(
    teachSkills: updatedTeachSkills,
  );

  emit(
    GetUserInfoSuccess(
      getUserInfoModel: updatedModel,
    ),
  );
}

  void removeLearnSkillLocally(String skill) {
    if (state is! GetUserInfoSuccess) {
      return;
    }
    final currentState = state as GetUserInfoSuccess;
    final currentModel = currentState.getUserInfoModel;

    final updatedTeachSkills = List<String>.from(
    currentModel.learnSkills,
  );

  updatedTeachSkills.remove(skill);


    final updatedModel = currentModel.copyWith(
      learnSkills: updatedTeachSkills
    );
    emit(GetUserInfoSuccess(getUserInfoModel: updatedModel));
  }
}
