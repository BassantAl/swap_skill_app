import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.firebaseFirestoreServices});
  final FirebaseFirestoreServices firebaseFirestoreServices;
  @override
  Future<Either<Failure, void>> addNewSkill({
    required String skill,
    required String fieldName,
  }) async {
    try {
      await firebaseFirestoreServices.addNewSkill(
        skill: skill,
        fieldName: fieldName,
      );
      return right<Failure, void>(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeSkill({
    required String skill,
    required String fieldName,
  }) async {
    try {
      await firebaseFirestoreServices.removeSkill(
        skill: skill,
        fieldName: fieldName,
      );
      return right<Failure, void>(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

@override
Future<List<GetUserInfoModel>> getRecommendedUsers({
  required GetUserInfoModel currentUser,
  required List<GetUserInfoModel> users,
  required List<FriendModel> friendships,
}) async {
  debugPrint('All users count: ${users.length}');
  debugPrint('Current user uid: ${currentUser.uid}');
  debugPrint('Current user teach skills: ${currentUser.teachSkills}');
  debugPrint('Current user learn skills: ${currentUser.learnSkills}');

  final friendIds = <String>{};

  for (final friendship in friendships) {
    if (friendship.user1Id == currentUser.uid) {
      friendIds.add(friendship.user2Id);
    } else if (friendship.user2Id == currentUser.uid) {
      friendIds.add(friendship.user1Id);
    }
  }

  debugPrint('Friend IDs: $friendIds');

  final recommendedUsers = users
      .where((user) {
        final isCurrentUser = user.uid == currentUser.uid;
        final isFriend = friendIds.contains(user.uid);

        return !isCurrentUser && !isFriend;
      })
      .map((user) {
        final score = _calculateMatchScore(
          currentUser,
          user,
        );

        debugPrint('''
User: ${user.fullName}
UID: ${user.uid}
Teach skills: ${user.teachSkills}
Learn skills: ${user.learnSkills}
Match score: $score
''');

        return MapEntry(user, score);
      })
      .where((entry) => entry.value > 0)
      .toList();

  recommendedUsers.sort(
    (a, b) => b.value.compareTo(a.value),
  );

  debugPrint(
    'Recommended users count: ${recommendedUsers.length}',
  );

  return recommendedUsers
      .map((entry) => entry.key)
      .toList();
}

  int _calculateMatchScore(
    GetUserInfoModel currentUser,
    GetUserInfoModel otherUser,
  ) {
    final currentLearnSkills = currentUser.learnSkills
        .map((skill) => skill.trim().toLowerCase())
        .toList();

    final currentTeachSkills = currentUser.teachSkills
        .map((skill) => skill.trim().toLowerCase())
        .toList();

    final otherTeachSkills = otherUser.teachSkills
        .map((skill) => skill.trim().toLowerCase())
        .toList();

    final otherLearnSkills = otherUser.learnSkills
        .map((skill) => skill.trim().toLowerCase())
        .toList();

    final teachMatch = currentLearnSkills
        .where((skill) => otherTeachSkills.contains(skill))
        .length;

    final learnMatch = currentTeachSkills
        .where((skill) => otherLearnSkills.contains(skill))
        .length;

    debugPrint(
      '${otherUser.fullName} | '
      'teachMatch: $teachMatch | '
      'learnMatch: $learnMatch',
    );

    return teachMatch + learnMatch;
  }
}
