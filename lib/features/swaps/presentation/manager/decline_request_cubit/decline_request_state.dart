part of 'decline_request_cubit.dart';

@immutable
sealed class DeclineRequestState {}

class DeclineRequestInitial extends DeclineRequestState {}

class DeclineRequestLoading extends DeclineRequestState {}

class DeclineRequestSuccess extends DeclineRequestState {}

class DeclineRequestFailure extends DeclineRequestState {
  final String message;

  DeclineRequestFailure(this.message);
}
