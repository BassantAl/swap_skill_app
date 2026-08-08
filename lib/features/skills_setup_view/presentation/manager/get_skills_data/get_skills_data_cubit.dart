import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

part 'get_skills_data_state.dart';

class GetSkillsDataCubit extends Cubit<GetSkillsDataState> {
  GetSkillsDataCubit() : super(GetSkillsDataInitial());
  var repo = getIt<SkillsSetupRepo>();
  Future<void> getSkillsData() async {
    emit(GetSkillsDataLoading());
    var result = await repo.getSkillsData();
    result.fold(
      (failure) {
        emit(GetSkillsDataFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(GetSkillsDataSuccess(skills: result));
      },
    );
  }
}
