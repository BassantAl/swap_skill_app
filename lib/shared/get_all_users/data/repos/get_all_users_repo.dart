import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

abstract class GetAllUsersRepo {
   Future<Either<Failure,List<GetUserInfoModel>>> getAllUsers();
   List<GetUserInfoModel> getAllUsersLocalStorage();
}