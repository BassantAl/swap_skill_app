import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,void>> addNewSkill({required String skill ,required String fieldName,});
  Future<Either<Failure,void>> removeSkill({required String skill ,required String fieldName,});
   Future<List<GetUserInfoModel>> getRecommendedUsers(
  { required GetUserInfoModel currentUser,
   required  List<GetUserInfoModel>users,
   required List<FriendModel> friendships,
   }
  );
}
