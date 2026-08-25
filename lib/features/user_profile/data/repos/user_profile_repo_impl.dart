import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/user_profile/data/repos/user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  UserProfileRepoImpl({required this.firebaseFirestoreServices});

  final FirebaseFirestoreServices firebaseFirestoreServices;

  @override
  Future<Either<Failure, void>> sendRequest({
    required String senderId,
    required String receiverId,
  }) async {
    try {
      final bool isExist = await firebaseFirestoreServices.requestExists(
        senderId: senderId,
        receiverId: receiverId,
      );

      if (isExist) {
        return Left(Failure(errorMessage: 'Request already exists'));
      }

      await firebaseFirestoreServices.createRequest(
        senderId: senderId,
        receiverId: receiverId,
      );

      return const Right(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
