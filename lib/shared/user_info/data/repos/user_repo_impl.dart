import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/local_storage_services.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl({
    required this.firebaseFirestoreServices,
    required this.localStorageServices,
  });
  final FirebaseFirestoreServices firebaseFirestoreServices;
  final LocalStorageServices localStorageServices;
  @override
  Future<Either<Failure, GetUserInfoModel>> getUserInfoFromFirebase() async {
    try {
      final result = await firebaseFirestoreServices.getUserInfo();
      await localStorageServices.saveData(key: 'user', value: result.toJson());
      return right(result);
    } on FirebaseException catch (e) {
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserInfoModel?>>
  getUserInfoFromLocalStorage() async {
    try {
      final result = await localStorageServices.getData(key: 'user');
       if (result == null) {
      return right(
        null
      );
    }
      final data =  GetUserInfoModel.fromFirestore(data: result);
      return right(data) ;
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

 @override
Future<void> saveUserLocally(
  GetUserInfoModel user,
) async {
  await localStorageServices.saveData(
    key: 'user',
    value: user.toJson(),
  );
}

  
}
