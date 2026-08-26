import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';

abstract class GetAllFriendsRepo {
  Future<Either<Failure, List<FriendModel>>> friends();
}
