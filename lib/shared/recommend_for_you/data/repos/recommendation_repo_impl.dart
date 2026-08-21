import 'package:flutter/foundation.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/recommend_for_you/data/repos/recomendation_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class RecommendationRepoImpl implements RecommendationsRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  final GetAllUsersRepo getAllUsersRepo;

  RecommendationRepoImpl({
    required this.firebaseFirestoreServices,
    required this.getAllUsersRepo,
  });

  @override
  Future<List<GetUserInfoModel>> getRecommendedUsers(
    GetUserInfoModel currentUser,
  ) async {
    final List<GetUserInfoModel> users =
        await getAllUsersRepo.getAllUsers();

    debugPrint(
      'All users count: ${users.length}',
    );

    debugPrint(
      'Current user uid: ${currentUser.uid}',
    );

    debugPrint(
      'Current user teach skills: ${currentUser.teachSkills}',
    );

    debugPrint(
      'Current user learn skills: ${currentUser.learnSkills}',
    );

    final recommendedUsers = users
        .where(
          (user) => user.uid != currentUser.uid,
        )
        .map(
          (user) {
            final score = _calculateMatchScore(
              currentUser,
              user,
            );

            debugPrint(
              '''
User: ${user.fullName}
UID: ${user.uid}
Teach skills: ${user.teachSkills}
Learn skills: ${user.learnSkills}
Match score: $score
''',
            );

            return MapEntry(user, score);
          },
        )
        .where(
          (entry) => entry.value > 0,
        )
        .toList();

    recommendedUsers.sort(
      (a, b) => b.value.compareTo(a.value),
    );

    debugPrint(
      'Recommended users count: ${recommendedUsers.length}',
    );

    return recommendedUsers
        .map(
          (entry) => entry.key,
        )
        .toList();
  }

  int _calculateMatchScore(
    GetUserInfoModel currentUser,
    GetUserInfoModel otherUser,
  ) {
    final currentLearnSkills = currentUser.learnSkills
        .map(
          (skill) => skill.trim().toLowerCase(),
        )
        .toList();

    final currentTeachSkills = currentUser.teachSkills
        .map(
          (skill) => skill.trim().toLowerCase(),
        )
        .toList();

    final otherTeachSkills = otherUser.teachSkills
        .map(
          (skill) => skill.trim().toLowerCase(),
        )
        .toList();

    final otherLearnSkills = otherUser.learnSkills
        .map(
          (skill) => skill.trim().toLowerCase(),
        )
        .toList();

    final teachMatch = currentLearnSkills
        .where(
          (skill) => otherTeachSkills.contains(skill),
        )
        .length;

    final learnMatch = currentTeachSkills
        .where(
          (skill) => otherLearnSkills.contains(skill),
        )
        .length;

    debugPrint(
      '${otherUser.fullName} | '
      'teachMatch: $teachMatch | '
      'learnMatch: $learnMatch',
    );

    return teachMatch + learnMatch;
  }
}