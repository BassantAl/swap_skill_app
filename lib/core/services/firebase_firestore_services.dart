import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<SkillsModel> getCategory({required String id}) async {
    final snapShot = await instance.collection('categories').doc(id).get();
    final data = snapShot.data();

    if (data == null || data['skills'] == null) {
      return SkillsModel(skills: []);
    }

    final SkillsModel skills = SkillsModel.fromFirestore(data);
    return skills;
  }
  
}
