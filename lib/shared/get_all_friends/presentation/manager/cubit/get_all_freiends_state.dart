part of 'get_all_freiends_cubit.dart';

@immutable
sealed class GetAllFreiendsState {}

final class GetAllFreiendsInitial extends GetAllFreiendsState {}

final class GetAllFreiendsSuccess extends GetAllFreiendsState {
    final List<FriendModel> friends;
  GetAllFreiendsSuccess({required this.friends});
}

final class GetAllFreiendsFailure extends GetAllFreiendsState {
  final String errorMessage;
  GetAllFreiendsFailure({required this.errorMessage});
}

final class GetAllFreiendsLoading extends GetAllFreiendsState {

}
