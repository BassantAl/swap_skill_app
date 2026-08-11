import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/shared/user/data/model/get_user_info_model.dart';
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

    final doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get();

    log('Document exists: ${doc.exists}');
    log('Document data: ${doc.data()}');

    return GetUserInfoModel.fromFirestore(data: doc.data());
  }
}
