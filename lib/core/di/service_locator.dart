import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/local_storage_services.dart';
import 'package:swap_skill/core/services/users_local_storage_sevices.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo_impl.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo.dart';
import 'package:swap_skill/features/chats/data/repos/chat_repo_impl.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';
import 'package:swap_skill/features/home/data/repos/home_repo_impl.dart';
import 'package:swap_skill/features/onboarding/data/repos/onboarding_repo.dart';
import 'package:swap_skill/features/onboarding/data/repos/onboarding_repo_impl.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo_impl.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo_impl.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo_impl.dart';
import 'package:swap_skill/features/user_profile/data/repos/user_profile_repo.dart';
import 'package:swap_skill/features/user_profile/data/repos/user_profile_repo_impl.dart';
import 'package:swap_skill/shared/get_all_friends/data/repos/get_all_friends_repo.dart';
import 'package:swap_skill/shared/get_all_friends/data/repos/get_all_friends_repo_impl.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo_impl.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo.dart';
import 'package:swap_skill/shared/user_info/data/repos/user_repo_impl.dart';
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthServices>(
    FirebaseAuthServices(),
  );

  getIt.registerSingleton<FirebaseFirestoreServices>(
    FirebaseFirestoreServices(),
  );

  final userBox = Hive.box('userBox');
  final skillsBox = Hive.box('skillsBox');
  final box2 = Hive.box<GetUserInfoModel>('usersbox');

  // User local storage
  getIt.registerSingleton<LocalStorageServices>(
    LocalStorageServices(
      box: userBox,
    ),
  );

  // Skills local storage
  getIt.registerSingleton<LocalStorageServices>(
    LocalStorageServices(
      box: skillsBox,
    ),
    instanceName: 'skillsStorage',
  );

  getIt.registerSingleton<UsersLocalStorageServices>(
    UsersLocalStorageServices(
      box: box2,
    ),
  );

  // Skills
  getIt.registerSingleton<SkillsSetupRepo>(
    SkillsSetupRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
      localStorageServices:
          getIt<LocalStorageServices>(
            instanceName: 'skillsStorage',
          ),
    ),
  );

  // Auth
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices:
          getIt<FirebaseAuthServices>(),
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
    ),
  );

  // Splash
  getIt.registerSingleton<SplashRepo>(
    SplashRepoImpl(
      firebaseAuthServices:
          getIt<FirebaseAuthServices>(),
      localStorageServices:
          getIt<LocalStorageServices>(),
    ),
  );

  // User
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
      localStorageServices:
          getIt<LocalStorageServices>(),
    ),
  );

  // Home
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
    ),
  );

  // All users
  getIt.registerSingleton<GetAllUsersRepo>(
    GetAllUsersRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
      usersLocalStorageServices:
          getIt<UsersLocalStorageServices>(),
    ),
  );

  // User profile
  getIt.registerSingleton<UserProfileRepo>(
    UserProfileRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
    ),
  );

  // Swaps
  getIt.registerSingleton<SwapRepo>(
    SwapRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
    ),
  );

  // Friends
  getIt.registerSingleton<GetAllFriendsRepo>(
    GetAllFriendsRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
    ),
  );

  // Chat
  getIt.registerSingleton<ChatRepo>(
    ChatRepoImpl(
      firebaseFirestoreServices:
          getIt<FirebaseFirestoreServices>(),
      firebaseAuthServices:
          getIt<FirebaseAuthServices>(),
      usersLocalStorageServices:
          getIt<UsersLocalStorageServices>(),
    ),
  );

  // Onboarding
  getIt.registerSingleton<OnboardingRepo>(
    OnboardingRepoImpl(
      localStorageServices:
          getIt<LocalStorageServices>(),
    ),
  );
}