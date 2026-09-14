import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_ce/hive.dart';

class PendingUserService {
  final Box box;

  PendingUserService({required this.box});

  Future<void> savePendingUser({
    required String uid,
    required String fullName,
    required String userName,
    required String email,
  }) async {
    await box.put('pendingUser', {
      'uid': uid,
      'fullName': fullName,
      'userName': userName,
      'email': email,
    });
  }

  Map<String, dynamic>? getPendingUser() {
    final data = box.get('pendingUser');

    if (data == null) {
      return null;
    }

    return Map<String, dynamic>.from(data);
  }

  bool belongsToCurrentUser() {
    final pendingUser = getPendingUser();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (pendingUser == null || currentUser == null) {
      return false;
    }

    return pendingUser['uid'] == currentUser.uid &&
        pendingUser['email'] == currentUser.email;
  }

  Future<void> clearPendingUser() async {
    await box.delete('pendingUser');
  }
}
