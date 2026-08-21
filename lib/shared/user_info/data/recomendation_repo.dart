import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

abstract class RecommendationsRepo {
  Future<List<GetUserInfoModel>> getAllUsers();

  Future<List<GetUserInfoModel>> getRecommendedUsers(
    GetUserInfoModel currentUser,
  );
}