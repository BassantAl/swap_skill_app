import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_model.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';

class FirebaseFirestoreServices {
  final instance = FirebaseFirestore.instance;

  Future<void> addUser({
    required String uid,
    required String fullName,
    required String userName,
    required String email,
  }) async {
    await instance.collection('Users').doc(uid).set({
      'uid': uid,
      'fullName': fullName,
      'userName': userName,
      'email': email,
    });
  }

  Future<List<CategoriesModel>> readData() async {
    final snapshot = await instance.collection('categories').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> data = snapshot.docs;
    List<CategoriesModel> skills = data
        .map((e) => CategoriesModel.fromFirestore(e))
        .toList();
    return skills;
  }

  Future<CategoriesModel> getCategory({required String id}) async {
    final snapshot = await instance.collection('categories').doc(id).get();

    return CategoriesModel.fromFirestore(snapshot);
  }

  Future<void> addSelectedSkills({
    required List<String> selectedSkills,
    required String fieldName,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await instance.collection('Users').doc(uid).update({
      fieldName: selectedSkills,
    });
  }

  Future<GetUserInfoModel> getUserInfo() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    log('Current UID: $uid');

    final doc = await instance.collection('Users').doc(uid).get();

    log('Document exists: ${doc.exists}');
    log('Document data: ${doc.data()}');

    return GetUserInfoModel.fromFirestore(data: doc.data());
  }

  Future<List<GetUserInfoModel>> getAllUsers() async {
    final snapshot = await instance.collection('Users').get();

    return snapshot.docs
        .map((doc) => GetUserInfoModel.fromFirestore(data: doc.data()))
        .toList();
  }

  Future<void> addNewSkill({
    required String skill,
    required String fieldName,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await instance.collection('Users').doc(uid).update({
      fieldName: FieldValue.arrayUnion([skill]),
    });
  }

  Future<void> removeSkill({
    required String skill,
    required String fieldName,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await instance.collection('Users').doc(uid).update({
      fieldName: FieldValue.arrayRemove([skill]),
    });
  }

  Future<void> createRequest({
    required String senderId,
    required String receiverId,
  }) async {
    await instance.collection('Requests').add({
      'senderId': senderId,
      'receiverId': receiverId,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<bool> requestExists({
    required String senderId,
    required String receiverId,
  }) async {
    final result = await instance
        .collection('Requests')
        .where('senderId', isEqualTo: senderId)
        .where('receiverId', isEqualTo: receiverId)
        .where('status', isEqualTo: 'pending')
        .limit(1)
        .get();
    return result.docs.isNotEmpty;
  }

  Future<List<SkillRequestModel>> getAllRequests() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    log('CURRENT UID = $uid');
    final result = await instance
        .collection('Requests')
        .where('receiverId', isEqualTo: uid)
        .get();
 log('Requests count: ${result.docs.length}');
    return result.docs
        .map((e) => SkillRequestModel.fromFirestore(e))
        .toList();

         
  }
  Future<GetUserInfoModel> getUserById({
  required String userId,
}) async {
  final doc = await instance
      .collection('Users')
      .doc(userId)
      .get();

  return GetUserInfoModel.fromFirestore(
    data: doc.data(),
  );
}
}
