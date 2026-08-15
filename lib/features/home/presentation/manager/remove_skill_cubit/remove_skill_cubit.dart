import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';

part 'remove_skill_state.dart';

class RemoveSkillCubit extends Cubit<RemoveSkillState> {
  RemoveSkillCubit() : super(RemoveSkillInitial());

  Future<void> removeSkill({
    required String skill,
    required String fieldName,
  }) async {
    final repo = getIt<HomeRepo>();

    emit(RemoveSkillLoading());

    final result = await repo.removeSkill(skill: skill, fieldName: fieldName);

    result.fold(
      (failure) {
        emit(RemoveSkillFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(RemoveSkillSuccess(skill: skill));
      },
    );
  }
}
