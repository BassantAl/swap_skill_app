import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitial());

  final repo = getIt<ChatRepo>();
  Future<void> sendMessage({
    required String chatId,
    required String message,
     required String receiverId,
  }) async {
    emit(SendMessageLoading());
    final result = await repo.sendMessage(chatId: chatId, message: message ,receiverId: receiverId);
    result.fold(
      (failure) {
        emit(SendMessageFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(SendMessageSuccess());
      },
    );
  }
}
