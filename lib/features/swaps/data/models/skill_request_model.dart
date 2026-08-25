import 'package:cloud_firestore/cloud_firestore.dart';

class SkillRequestModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String status;
  final DateTime createdAt;

  SkillRequestModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.status,
    required this.createdAt,
  });

  factory SkillRequestModel.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    return SkillRequestModel(
      id: doc.id,
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      status: data['status'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}