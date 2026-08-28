import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/chats/data/models/chat_with_user_model.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

part 'get_all_chats_for_user_state.dart';

class GetAllChatsForUserCubit extends Cubit<GetAllChatsForUserState> {
  GetAllChatsForUserCubit() : super(GetAllChatsForUserInitial());
  final repo = getIt<ChatRepo>();
  StreamSubscription? _streamSubscription;
  void getAllChatsForUser() {
    _streamSubscription?.cancel();
    emit(GetAllChatsForUserLoading());
    _streamSubscription = repo.getAllChatsForUser().listen((data) {
      data.fold(
        (failure) {
          emit(GetAllChatsForUserFailure(errorMessage: failure.errorMessage));
        },
        (chats) {
          emit(GetAllChatsForUserSuccess(chats: chats));
        },
      );
    });
  }

  @override
  Future<void> close() {
        _streamSubscription?.cancel();
    return super.close();

  }
}
