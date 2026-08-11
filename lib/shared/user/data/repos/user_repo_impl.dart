import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/shared/user/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user/data/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl({required this.firebaseFirestoreServices});
  final FirebaseFirestoreServices firebaseFirestoreServices;
  @override
  Future<Either<Failure, GetUserInfoModel>> getUserInfo() async {
    try {
      var result = await firebaseFirestoreServices.getUserInfo();
      return right(result);
    } on FirebaseException catch (e) {
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
