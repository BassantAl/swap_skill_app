import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String name;
  final SkillsModel skills;
  CategoriesModel({required this.name, required this.skills});
  factory CategoriesModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    return CategoriesModel(
      name: data.id,
      skills: SkillsModel.fromFirestore(data.data()),
    );
  }
}

class SkillsModel {
  final List<String> skills;
  SkillsModel({required this.skills});

  factory SkillsModel.fromFirestore(Map<String, dynamic> data) {
    return SkillsModel(skills: List<String>.from(data['skills'] ?? []));
  }
}
