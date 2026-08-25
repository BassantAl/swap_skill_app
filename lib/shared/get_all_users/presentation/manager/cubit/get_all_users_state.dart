part of 'get_all_users_cubit.dart';

@immutable
sealed class GetAllUsersState {}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUserslSuccess extends GetAllUsersState {
  GetAllUserslSuccess({required this.users});
  final List<GetUserInfoModel> users;
}

final class GetAllUsersFailure extends GetAllUsersState {
  final String errorMessage;
  GetAllUsersFailure({required this.errorMessage});
}

final class GetAllSearchResultlSuccess extends GetAllUsersState {
  GetAllSearchResultlSuccess({required this.users});
  final List<GetUserInfoModel> users;
}
