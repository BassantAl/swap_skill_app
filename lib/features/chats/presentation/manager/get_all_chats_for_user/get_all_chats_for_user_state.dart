part of 'get_all_chats_for_user_cubit.dart';

@immutable
sealed class GetAllChatsForUserState {}

final class GetAllChatsForUserInitial extends GetAllChatsForUserState {}

final class GetAllChatsForUserSuccess extends GetAllChatsForUserState {
  final List<ChatWithUserModel> chats;
  GetAllChatsForUserSuccess({required this.chats});
}

final class GetAllChatsForUserFailure extends GetAllChatsForUserState {
  final String errorMessage;
  GetAllChatsForUserFailure({required this.errorMessage});
}

final class GetAllChatsForUserLoading extends GetAllChatsForUserState {}
