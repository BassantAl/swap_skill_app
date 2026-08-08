import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

part 'get_skills_data_state.dart';

class GetSkillsDataCubit extends Cubit<GetSkillsDataState> {
  GetSkillsDataCubit() : super(GetSkillsDataInitial());

  final repo = getIt<SkillsSetupRepo>();

  List<CategoriesModel> allCategories = [];

  Future<void> getSkillsData() async {
    emit(GetSkillsDataLoading());

    final result = await repo.getSkillsData();

    result.fold(
      (failure) {
        emit(
          GetSkillsDataFailure(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (result) {
        allCategories = result;

        emit(
          GetSkillsDataSuccess(
            skills: result,
          ),
        );
      },
    );
  }

  void searchSkills(String query) {
    final searchQuery = query.trim().toLowerCase();

    if (searchQuery.isEmpty) {
      emit(
        GetSkillsDataSuccess(
          skills: allCategories,
        ),
      );
      return;
    }

    final filteredCategories = allCategories
        .map(
          (category) {
            final filteredSkills = category.skills.skills
                .where(
                  (skill) =>
                      skill.toLowerCase().contains(searchQuery),
                )
                .toList();

            return CategoriesModel(
              name: category.name,
              skills: SkillsModel(
                skills: filteredSkills,
              ),
            );
          },
        )
        .where(
          (category) => category.skills.skills.isNotEmpty,
        )
        .toList();

    emit(
      GetSkillsDataSuccess(
        skills: filteredCategories,
      ),
    );
  }
}