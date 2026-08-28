import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

part 'get_all_messages_state.dart';

class GetAllMessagesCubit extends Cubit<GetAllMessagesState> {
  GetAllMessagesCubit({required this.chatId}) : super(GetAllMessagesInitial());
  final String chatId;
  final repo = getIt<ChatRepo>();
  StreamSubscription? _streamSubscription;
  void getAllMessages() {
    _streamSubscription?.cancel();
    emit(GetAllMessagesLoading());
    _streamSubscription = repo.getAllMessages(chatId: chatId).listen((data) {
      data.fold(
        (failure) {
          emit(GetAllMessagesFailure(errorMessage: failure.errorMessage));
        },
        (messages) {
          emit(GetAllMessagesSuccess(messages: messages));
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
