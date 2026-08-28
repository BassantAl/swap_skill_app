import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> createChat({required String receiverId});
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required String message,
  });

  Stream<Either<Failure, List<ChatModel>>> getAllChatsForUser();
  Stream<Either<Failure, List<MessageModel>>> getAllMessages({
    required String chatId,
  });
}
