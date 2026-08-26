import 'package:cloud_firestore/cloud_firestore.dart';

class FriendModel {
  final String user1Id, user2Id, friendshipId;

  FriendModel({
    required this.user1Id,
    required this.user2Id,
    required this.friendshipId,
  });

  factory FriendModel.fromFirebase({
    required QueryDocumentSnapshot<Map<String, dynamic>> doc,
  }) {
    final data = doc.data();
    return FriendModel(
      user1Id: data['user1Id'],
      user2Id: data['user2Id'],
      friendshipId: doc.id,
    );
  }
}
