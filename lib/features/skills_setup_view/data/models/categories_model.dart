import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String name;
  final SkillsModel skills;

  CategoriesModel({
    required this.name,
    required this.skills,
  });

  // Firestore -> Model
  factory CategoriesModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> data,
  ) {
    return CategoriesModel(
      name: data.id,
      skills: SkillsModel.fromFirestore(
        data.data() ?? {},
      ),
    );
  }

  // Model -> Map
  // Used before saving to Hive
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'skills': skills.toMap(),
    };
  }

  // Hive Map -> Model
  factory CategoriesModel.fromMap(
    Map<String, dynamic> data,
  ) {
    final skillsData = data['skills'];

    return CategoriesModel(
      name: data['name']?.toString() ?? '',
      skills: SkillsModel.fromMap(
        Map<String, dynamic>.from(
          skillsData as Map,
        ),
      ),
    );
  }
}

class SkillsModel {
  final List<String> skills;

  SkillsModel({
    required this.skills,
  });

  // Firestore Map -> Model
  factory SkillsModel.fromFirestore(
    Map<String, dynamic> data,
  ) {
    return SkillsModel(
      skills: List<String>.from(
        data['skills'] ?? [],
      ),
    );
  }

  // Model -> Map
  // Used before saving to Hive
  Map<String, dynamic> toMap() {
    return {
      'skills': skills,
    };
  }

  // Hive Map -> Model
  factory SkillsModel.fromMap(
    Map<String, dynamic> data,
  ) {
    return SkillsModel(
      skills: List<String>.from(
        data['skills'] ?? []),
    );
  }
}