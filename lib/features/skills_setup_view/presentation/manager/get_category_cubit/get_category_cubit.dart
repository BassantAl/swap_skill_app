import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit() : super(GetCategoryInitial());
  var repo = getIt<SkillsSetupRepo>();
  Future<void> getCategory({required String id}) async {
    emit(GetCategoryLoading());
    var result = await repo.getCategory(id: id);
    result.fold(
      (failure) {
        emit(GetCategoryFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(GetCategorySuccess(categoriesModel: result));
      },
    );
    
  }

  void resetCategory() {
    emit(GetCategoryInitial());
  }
}
