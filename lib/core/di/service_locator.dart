import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/local_storage_services.dart';
import 'package:swap_skill/core/services/users_local_storage_sevices.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo_impl.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';
import 'package:swap_skill/features/home/data/repos/home_repo_impl.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo_impl.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo_impl.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo_impl.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<FirebaseFirestoreServices>(
    FirebaseFirestoreServices(),
  );
  final box = Hive.box('userBox');
  final box2 = Hive.box<GetUserInfoModel>('usersbox');
  getIt.registerSingleton<LocalStorageServices>(LocalStorageServices(box: box));
  getIt.registerSingleton<UsersLocalStorageServices>(
    UsersLocalStorageServices(box: box2),
  );
  getIt.registerSingleton<SkillsSetupRepo>(
    SkillsSetupRepoImpl(
      firebaseFirestoreServices: getIt<FirebaseFirestoreServices>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      firebaseFirestoreServices: getIt<FirebaseFirestoreServices>(),
    ),
  );

  getIt.registerSingleton<SplashRepo>(
    SplashRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );

  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      firebaseFirestoreServices: getIt<FirebaseFirestoreServices>(),
      localStorageServices: getIt<LocalStorageServices>(),
    ),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(firebaseFirestoreServices: getIt<FirebaseFirestoreServices>()),
  );

  getIt.registerSingleton<GetAllUsersRepo>(
    GetAllUsersRepoImpl(
      firebaseFirestoreServices: getIt<FirebaseFirestoreServices>(),
      usersLocalStorageServices: getIt<UsersLocalStorageServices>(),
    ),
  );
}
