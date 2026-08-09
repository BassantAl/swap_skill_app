import 'package:get_it/get_it.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo_impl.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo_impl.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_skills_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<FirebaseFirestoreServices>(
    FirebaseFirestoreServices(),
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

  getIt.registerSingleton<SelectedSkillsCubit>(
    SelectedLearnSkillsCubit()
  );
}
