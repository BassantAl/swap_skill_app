import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
import 'package:swap_skill/shared/get_all_friends/data/repos/get_all_friends_repo.dart';

part 'get_all_freiends_state.dart';

class GetAllFreiendsCubit extends Cubit<GetAllFreiendsState> {
  GetAllFreiendsCubit() : super(GetAllFreiendsInitial());

  final repo = getIt<GetAllFriendsRepo>();

  Future<void> getAllFriends() async {
    emit(GetAllFreiendsLoading());
    final result = await repo.friends();

    result.fold(
      (failure) {
        emit(GetAllFreiendsFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(GetAllFreiendsSuccess(friends: result));
      },
    );
  }
}
