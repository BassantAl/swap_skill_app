part of 'accept_request_cubit_cubit.dart';

@immutable
sealed class AcceptRequestCubitState {}


class AcceptRequestInitial extends AcceptRequestCubitState {}

class AcceptRequestLoading extends AcceptRequestCubitState {}

class AcceptRequestSuccess extends AcceptRequestCubitState {}

class AcceptRequestFailure extends AcceptRequestCubitState {
  final String message;

  AcceptRequestFailure(this.message);
}