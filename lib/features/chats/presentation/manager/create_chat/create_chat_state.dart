part of 'create_chat_cubit.dart';

@immutable
sealed class CreateChatState {}

final class CreateChatInitial extends CreateChatState {}

final class CreateChatLoading extends CreateChatState {}

final class CreateChatSuccess extends CreateChatState {
  final String chatId;
  CreateChatSuccess({required this.chatId});
}

final class CreateChatFailure extends CreateChatState {
  final String errorMessage;
  CreateChatFailure({required this.errorMessage});
}
