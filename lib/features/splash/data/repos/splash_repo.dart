import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';

abstract class SplashRepo {
  User? get currentUser;

  Future<Either < Failure,Map<String, dynamic>?>> getUserInfo();
}
