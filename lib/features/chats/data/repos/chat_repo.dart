import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> createChat({required String receiverId});
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required String message,
  });
}
