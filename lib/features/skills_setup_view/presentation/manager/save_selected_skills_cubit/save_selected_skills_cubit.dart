import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

part 'save_selected_skills_state.dart';

class SaveSelectedSkillsCubit
    extends Cubit<SaveSelectedSkillsState> {
  SaveSelectedSkillsCubit()
      : super(SaveSelectedSkillsInitial());

  final repo = getIt<SkillsSetupRepo>();

  Future<void> saveSelectedSkills({
    required List<String> selectedSkills,
    required String fieldName,
  }) async {
    emit(SaveSelectedSkillsLoading());

    final result = await repo.addSelectedSkills(
      selectedSkills: selectedSkills,
      fieldName: fieldName,
    );

    result.fold(
      (failure) {
        emit(
          SaveSelectedSkillsFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (_) {
        emit(SaveSelectedSkillsSuccess());
      },
    );
  }
}