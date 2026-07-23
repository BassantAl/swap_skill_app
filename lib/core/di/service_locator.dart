import 'package:get_it/get_it.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<FirebaseFirestoreServices>(
    FirebaseFirestoreServices(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>(), firebaseFirestoreServices: getIt<FirebaseFirestoreServices>()),
  );
  
}
