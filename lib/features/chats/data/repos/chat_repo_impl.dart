import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  ChatRepoImpl({required this.firebaseFirestoreServices});
  @override
  Future<Either<Failure, String>> createChat({
    required String receiverId,
  }) async {
    try {
      var result = await firebaseFirestoreServices.createChat(
        receiverId: receiverId,
      );
      return right(result);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required String message,
  }) async {
    try {
      await firebaseFirestoreServices.sendMessage(
        chatId: chatId,
        message: message,
      );
      return right(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ChatModel>>> getAllChatsForUser() async* {
    try {
      await for (final result
          in firebaseFirestoreServices.getAllChatsForUser()) {
        yield right(result);
      }
    } catch (error) {
      if (error is FirebaseException) {
        yield left(FirebaseFirestoreErrors.fromFirebaseException(error));
      } else {
        yield left(Failure(errorMessage: error.toString()));
      }
    }
  }

  @override
  Stream<Either<Failure, List<MessageModel>>> getAllMessages({
    required String chatId,
  }) async* {
    try {
      await for (final result in firebaseFirestoreServices.getAllMessages(
        chatId: chatId,
      )) {
        yield right(result);
      }
    } catch (e) {
      if (e is FirebaseException) {
        yield left(FirebaseFirestoreErrors.fromFirebaseException(e));
      } else {
        yield left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
