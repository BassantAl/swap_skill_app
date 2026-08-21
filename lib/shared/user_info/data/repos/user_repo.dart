import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

abstract class UserRepo {
  Future<Either<Failure, GetUserInfoModel>> getUserInfoFromFirebase();
  Future<Either<Failure, GetUserInfoModel?>> getUserInfoFromLocalStorage();

 Future<void> saveUserLocally(
  GetUserInfoModel user,
);
}
