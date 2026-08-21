part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  GetUserInfoSuccess({required this.getUserInfoModel});
  final GetUserInfoModel getUserInfoModel;
}

final class GetUserInfoFailure extends GetUserInfoState {
  GetUserInfoFailure({required this.errorMessage});
  final String errorMessage;
}
