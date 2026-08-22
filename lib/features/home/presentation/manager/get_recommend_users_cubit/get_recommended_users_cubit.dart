import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

part 'get_recommended_users_state.dart';

class GetRecommendedUsersCubit extends Cubit<GetRecommendedUsersState> {
  GetRecommendedUsersCubit() : super(GetRecommendedUsersInitial());
  final repo = getIt<HomeRepo>();
  Future<void> getRecommendedUsers({
    required GetUserInfoModel currentUser,
    required List<GetUserInfoModel> users,
  }) async {
    emit(GetRecommendedUsersLoading());
    try {
      final recommendedUsers = await repo.getRecommendedUsers(
        currentUser: currentUser,
        users: users,
      );
      log('Recommended users count: ${recommendedUsers.length}');

      emit(GetRecommendedUsersSuccess(recommendedUsers));
    } catch (e) {
      emit(GetRecommendedUsersFailure(e.toString()));
    }
  }
}
