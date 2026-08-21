import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  final repo = getIt<UserRepo>();
  GetUserInfoModel? _previousUser;
  Future<void> getUserInfo() async {
    final localResult = await repo.getUserInfoFromLocalStorage();

    bool hasCachedUser = false;

    localResult.fold(
      (failure) {
        log('GET LOCAL USER INFO FAILURE: ${failure.errorMessage}');
      },
      (cachedData) {
        if (cachedData != null) {
          hasCachedUser = true;
          emit(GetUserInfoSuccess(getUserInfoModel: cachedData));
        } else {
          emit(GetUserInfoLoading());
        }
      },
    );
    final result = await repo.getUserInfoFromFirebase();
    result.fold(
      (failure) {
        log('GET USER INFO FAILURE: ${failure.errorMessage}');

        if (!hasCachedUser) {
          emit(GetUserInfoFailure(errorMessage: failure.errorMessage));
        }
      },
      (result) {
        log('GET USER INFO SUCCESS: $result');

        emit(GetUserInfoSuccess(getUserInfoModel: result));
      },
    );
  }

  void addSkillLocally({
    required String skill,
    required bool isTeachSkill,
  }) async {
    if (state is! GetUserInfoSuccess) return;
    final currentUser = (state as GetUserInfoSuccess).getUserInfoModel;
    _previousUser = currentUser;
    final updatedSkills = List<String>.from(
      isTeachSkill ? currentUser.teachSkills : currentUser.learnSkills,
    );
    updatedSkills.add(skill);
    final updatedUser = isTeachSkill
        ? currentUser.copyWith(teachSkills: updatedSkills)
        : currentUser.copyWith(learnSkills: updatedSkills);
    emit(GetUserInfoSuccess(getUserInfoModel: updatedUser));
    await repo.saveUserLocally(updatedUser);
  }

  void removeSkillLocally({
    required String skill,
    required bool isTeachSkill,
  }) async {
    if (state is! GetUserInfoSuccess) return;
    final currentUser = (state as GetUserInfoSuccess).getUserInfoModel;
    _previousUser = currentUser;
    final updatedSkills = List<String>.from(
      isTeachSkill ? currentUser.teachSkills : currentUser.learnSkills,
    );
    updatedSkills.remove(skill);
    final updatedUser = isTeachSkill
        ? currentUser.copyWith(teachSkills: updatedSkills)
        : currentUser.copyWith(learnSkills: updatedSkills);
    emit(GetUserInfoSuccess(getUserInfoModel: updatedUser));
    await repo.saveUserLocally(updatedUser);
  }

  Future<void> restorePreviousUser() async {
    if (_previousUser == null) return;

    emit(
      GetUserInfoSuccess(
        getUserInfoModel: _previousUser!,
      ),
    );

    await repo.saveUserLocally(_previousUser!);

    _previousUser = null;
  }
}
