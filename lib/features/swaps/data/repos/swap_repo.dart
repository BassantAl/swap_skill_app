import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';

abstract class SwapRepo {
  Future<Either<Failure, List<SkillRequestWithSenderModel>>> getAllRequests();
  Future<Either<Failure, void>> acceptRequest({
    required String requestId,
    required String senderId,
    required String receiverId,
  });
  Future<Either<Failure, void>> declineRequest({required String requestId});
}
