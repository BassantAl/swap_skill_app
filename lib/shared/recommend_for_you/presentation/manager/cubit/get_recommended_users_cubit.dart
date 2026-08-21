import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/shared/recommend_for_you/data/repos/recomendation_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

part 'get_recommended_users_state.dart';

class GetRecommendedUsersCubit
    extends Cubit<GetRecommendedUsersState> {
  final RecommendationsRepo recommendationsRepo;

  GetRecommendedUsersCubit(
    this.recommendationsRepo,
  ) : super(GetRecommendedUsersInitial());

  Future<void> getRecommendedUsers(
    GetUserInfoModel currentUser,
  ) async {
    emit(GetRecommendedUsersLoading());

    try {
      final users = await recommendationsRepo
          .getRecommendedUsers(currentUser);
          log('Recommended users count: ${users.length}');

      emit(
        GetRecommendedUsersSuccess(users),
      );
    } catch (e) {
      emit(
        GetRecommendedUsersFailure(
          e.toString(),
        ),
      );
    }
  }
}