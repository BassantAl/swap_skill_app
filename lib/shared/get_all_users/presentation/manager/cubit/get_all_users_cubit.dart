import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit() : super(GetAllUsersInitial());
  final repo = getIt<GetAllUsersRepo>();

  Future<void> getAllUsers() async {
    final localData = repo.getAllUsersLocalStorage();
    if (localData.isNotEmpty) {
      emit(GetAllUserslSuccess(users: localData));
    } else {
      emit(GetAllUsersLoading());
    }

    final result = await repo.getAllUsers();
    result.fold(
      (failure) {
        if (localData.isEmpty) {
          emit(GetAllUsersFailure(errorMessage: failure.errorMessage));
        }
      },
      (result) {
        emit(GetAllUserslSuccess(users: result));
      },
    );
  }

  void searchForSkillOrPerson(final String query) {
    final localData = repo.getAllUsersLocalStorage();


    final searchQuery = query.trim().toLowerCase();

      final searchResult=localData.where((user) {
      final name = user.fullName.trim();
      final teachSkills = user.teachSkills
          .map((skill) => skill.toLowerCase())
          .toList();

      final learnSkills = user.learnSkills
          .map((skill) => skill.toLowerCase())
          .toList();

      return name.toLowerCase().contains(searchQuery) ||
          teachSkills.any((skill) => skill.contains(searchQuery)) ||
          learnSkills.any((skill) => skill.contains(searchQuery));
    }).toList();
    emit(
      GetAllSearchResultlSuccess(
        users: searchResult,
      ),
    );
  }
  
}
