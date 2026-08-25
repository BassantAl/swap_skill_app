part of 'get_all_requests_cubit.dart';

@immutable
sealed class GetAllRequestsState {}

final class GetAllRequestsInitial extends GetAllRequestsState {}

final class GetAllRequestsSuccess extends GetAllRequestsState {
  final List<SkillRequestWithSenderModel> requests;
  GetAllRequestsSuccess({required this.requests});
}

final class GetAllRequestsLoading extends GetAllRequestsState {}

final class GetAllRequestsFailure extends GetAllRequestsState {
  final String errorMessage;
  GetAllRequestsFailure({required this.errorMessage});
}
