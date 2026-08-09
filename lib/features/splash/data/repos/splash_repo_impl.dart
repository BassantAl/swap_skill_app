import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  SplashRepoImpl({required this.firebaseAuthServices});
  final FirebaseAuthServices firebaseAuthServices;
  @override
  User? get currentUser => firebaseAuthServices.currentUser;
}
