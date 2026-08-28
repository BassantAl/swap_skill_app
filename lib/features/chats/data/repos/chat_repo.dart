import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/chats/data/models/chat_with_user_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> createChat({required String receiverId});
  Future<Either<Failure, void>> sendMessage({
     required String receiverId,
    required String chatId,
    required String message,
  });

  Stream<Either<Failure, List<ChatWithUserModel>>> getAllChatsForUser();
  Stream<Either<Failure, List<MessageModel>>> getAllMessages({
    
    required String chatId,
  });

}
