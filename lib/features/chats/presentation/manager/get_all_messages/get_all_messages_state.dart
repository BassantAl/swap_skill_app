part of 'get_all_messages_cubit.dart';

@immutable
sealed class GetAllMessagesState {}

final class GetAllMessagesInitial extends GetAllMessagesState {}

final class GetAllMessagesSuccess extends GetAllMessagesState {
  final List<MessageModel> messages;
  GetAllMessagesSuccess({required this.messages});
}

final class GetAllMessagesFailure extends GetAllMessagesState {
  final String errorMessage;
  GetAllMessagesFailure({required this.errorMessage});
}

final class GetAllMessagesLoading extends GetAllMessagesState {}
