import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo.dart';

class SwapRepoImpl implements SwapRepo {
  SwapRepoImpl({required this.firebaseFirestoreServices});
  final FirebaseFirestoreServices firebaseFirestoreServices;

  @override
  Future<Either<Failure, List<SkillRequestWithSenderModel>>>
  getAllRequests() async {
    try {
      final result = await firebaseFirestoreServices.getAllRequests();
      final requests = <SkillRequestWithSenderModel>[];
      for (final item in result) {
        final sender = await firebaseFirestoreServices.getUserById(
          userId: item.senderId,
        );
        requests.add(
          SkillRequestWithSenderModel(request: item, sender: sender),
        );
      }
      return right(requests);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptRequest({
    required String requestId,
    required String senderId,
    required String receiverId,
  }) async {
    try {
      await firebaseFirestoreServices.acceptRequest(
        requestId: requestId,
        senderId: senderId,
        receiverId: receiverId,
      );
      return right(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> declineRequest({
    required String requestId,
  }) async {
    try {
      await firebaseFirestoreServices.declineRequest(requestId: requestId);
      return right(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
