import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/users_local_storage_sevices.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class GetAllUsersRepoImpl implements GetAllUsersRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  final UsersLocalStorageServices usersLocalStorageServices;
  GetAllUsersRepoImpl({
    required this.firebaseFirestoreServices,
    required this.usersLocalStorageServices,
  });
  @override
  Future<Either<Failure, List<GetUserInfoModel>>> getAllUsers() async {
    try {
      final result = await firebaseFirestoreServices.getAllUsers();
      await usersLocalStorageServices.saveUsers(result);
      return right(result);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    }
  }

  @override
  List<GetUserInfoModel> getAllUsersLocalStorage()  {
    List<GetUserInfoModel> users =   usersLocalStorageServices.getUsers();
    return users;
  }
}
