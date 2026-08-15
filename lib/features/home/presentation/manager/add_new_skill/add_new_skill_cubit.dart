import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';

part 'add_new_skill_state.dart';

class AddNewSkillCubit extends Cubit<AddNewSkillState> {
  AddNewSkillCubit() : super(AddNewSkillInitial());

  Future<void> addNewSkill({
  required String skill,
  required String fieldName,
}) async {
  final repo = getIt<HomeRepo>();

  emit(AddNewSkillLoading());

  final result = await repo.addNewSkill(
    skill: skill,
    fieldName: fieldName,
  );

  result.fold(
    (failure) {
      emit(
        AddNewSkillFailure(
          errorMessage: failure.errorMessage,
        ),
      );
    },
    (_) {
      emit(
        AddNewSkillSuccess(
          skill: skill,
        ),
      );
    },
  );
}
}
