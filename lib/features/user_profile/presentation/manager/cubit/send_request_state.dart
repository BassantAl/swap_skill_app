part of 'send_request_cubit.dart';

@immutable
sealed class SendRequestState {}

final class SendRequestInitial extends SendRequestState {}

class SendRequestLoading extends SendRequestState {}

class SendRequestSuccess extends SendRequestState {}

class SendRequestFailure extends SendRequestState {
  final String message;

  SendRequestFailure({required this.message});
}
