import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';

abstract class UserProfileRepo { 
  Future<Either<Failure,void>> sendRequest({
    required String senderId,
    required String receiverId,
  });
}
