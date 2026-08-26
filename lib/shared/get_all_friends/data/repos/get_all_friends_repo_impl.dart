import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
import 'package:swap_skill/shared/get_all_friends/data/repos/get_all_friends_repo.dart';

class GetAllFriendsRepoImpl implements GetAllFriendsRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  GetAllFriendsRepoImpl({required this.firebaseFirestoreServices});
  @override
  Future<Either<Failure, List<FriendModel>>> friends() async {
    try {
      List<FriendModel> friends = await firebaseFirestoreServices.getAllFriends(
      );
      return right(friends);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
