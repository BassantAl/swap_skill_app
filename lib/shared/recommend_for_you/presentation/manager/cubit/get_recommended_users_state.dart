part of 'get_recommended_users_cubit.dart';

@immutable
sealed class GetRecommendedUsersState {}

final class GetRecommendedUsersInitial
    extends GetRecommendedUsersState {}

final class GetRecommendedUsersLoading
    extends GetRecommendedUsersState {}

final class GetRecommendedUsersSuccess
    extends GetRecommendedUsersState {
  final List<GetUserInfoModel> users;

  GetRecommendedUsersSuccess(this.users);
}

final class GetRecommendedUsersFailure
    extends GetRecommendedUsersState {
  final String errorMessage;

  GetRecommendedUsersFailure(this.errorMessage);
}