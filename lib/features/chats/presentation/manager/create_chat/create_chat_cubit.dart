import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

part 'create_chat_state.dart';

class CreateChatCubit extends Cubit<CreateChatState> {
  CreateChatCubit() : super(CreateChatInitial());
  final repo = getIt<ChatRepo>();
  Future<String> createChat({required String receiverId}) async {
    emit(CreateChatLoading());
    final result = await repo.createChat(receiverId: receiverId);
    return result.fold<String>(
      (failure) {
        emit(CreateChatFailure(errorMessage: failure.errorMessage));
        throw Exception(failure.errorMessage);
      },
      (chatid) {
        emit(CreateChatSuccess(chatId: chatid));
        return chatid;
      },
    );
  }
}
