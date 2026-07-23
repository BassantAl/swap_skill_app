import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> signup({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  });

  
}
