import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/users_local_storage_sevices.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/chats/data/models/chat_with_user_model.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  final FirebaseAuthServices firebaseAuthServices;
  final UsersLocalStorageServices usersLocalStorageServices;
  ChatRepoImpl({
    required this.firebaseFirestoreServices,
    required this.firebaseAuthServices,
    required this.usersLocalStorageServices,
  });
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
     required String receiverId,
  }) async {
    try {
      await firebaseFirestoreServices.sendMessage(
        chatId: chatId,
        message: message,
        receiverId: receiverId
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
  Stream<Either<Failure, List<ChatWithUserModel>>> getAllChatsForUser() async* {
    try {
      final currentUser = firebaseAuthServices.currentUser;
      await for (final result
          in firebaseFirestoreServices.getAllChatsForUser()) {
        log('CHATS FROM FIREBASE: $result');
        final chatsWithUsers = <ChatWithUserModel>[];

        for (var item in result) {
          final otherUserId = item.participants.firstWhere(
            (userId) => userId != currentUser?.uid,
          );
          final otherUser = usersLocalStorageServices.getUserById(
            userId: otherUserId,
          );
          if (otherUser == null) {
            continue;
          }
          chatsWithUsers.add(ChatWithUserModel(chat: item, user: otherUser));
        }

        yield right(chatsWithUsers);
      }
    } catch (error) {
      log('GET CHATS ERROR: $error');

      if (error is FirebaseException) {
        log('FIREBASE ERROR CODE: ${error.code}');
        log('FIREBASE ERROR MESSAGE: ${error.message}');

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
