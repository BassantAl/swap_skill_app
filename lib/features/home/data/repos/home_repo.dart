import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure,void>> addNewSkill({required String skill ,required String fieldName,});
  Future<Either<Failure,void>> removeSkill({required String skill ,required String fieldName,});
}
