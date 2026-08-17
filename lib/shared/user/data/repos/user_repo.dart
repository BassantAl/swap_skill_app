import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/shared/user/data/model/get_user_info_model.dart';

abstract class UserRepo {
  Future<Either<Failure, GetUserInfoModel>> getUserInfo();
  Either<Failure, GetUserInfoModel?> getCachedUser();
}
