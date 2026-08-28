import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_model.dart';
import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
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
        .where('status', isEqualTo: 'pending')
        .get();

    log('Requests count: ${result.docs.length}');

    return result.docs.map((e) => SkillRequestModel.fromFirestore(e)).toList();
  }

  Future<GetUserInfoModel> getUserById({required String userId}) async {
    final doc = await instance.collection('Users').doc(userId).get();

    return GetUserInfoModel.fromFirestore(data: doc.data());
  }

  Future<void> acceptRequest({
    required String requestId,
    required String senderId,
    required String receiverId,
  }) async {
    await instance.runTransaction((transaction) {
      final requestRef = instance.collection('Requests').doc(requestId);

      final ids = [senderId, receiverId]..sort();

      final friendshipId = '${ids[0]}_${ids[1]}';

      final friendshipRef = instance
          .collection('friendships')
          .doc(friendshipId);

      transaction.update(requestRef, {'status': 'accepted'});

      transaction.set(friendshipRef, {
        'user1Id': senderId,
        'user2Id': receiverId,
        'createdAt': FieldValue.serverTimestamp(),
      });
      return Future.value();
    });
  }

  Future<void> declineRequest({required String requestId}) async {
    await instance.collection('Requests').doc(requestId).update({
      'status': 'rejected',
    });
  }

  Future<List<FriendModel>> getAllFriends() async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final user1Snapshot = await instance
        .collection('friendships')
        .where('user1Id', isEqualTo: currentUserId)
        .get();

    final user2Snapshot = await instance
        .collection('friendships')
        .where('user2Id', isEqualTo: currentUserId)
        .get();

    final friends = <FriendModel>[];

    for (final doc in user1Snapshot.docs) {
      friends.add(FriendModel.fromFirebase(doc: doc));
    }

    for (final doc in user2Snapshot.docs) {
      friends.add(FriendModel.fromFirebase(doc: doc));
    }

    return friends;
  }

  Future<String> createChat({required String receiverId}) async {
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    final id = [senderId, receiverId]..sort();

    final chatId = '${id[0]}_${id[1]}';

    await instance.collection('chats').doc(chatId).set({
      'participants': id,
      'unreadMessages': {senderId: 0, receiverId: 0},
    });
    log('CHAT CREATED = chats/$chatId');
    return chatId;
  }

  Future<void> sendMessage({
    required String chatId,
    required String message,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    final chatRef = instance.collection('chats').doc(chatId);
    final snapshot = await chatRef.get();
    final data = snapshot.data();
    final participants = List<String>.from(data?['participants'] ?? []);
    final receiverId = participants.firstWhere((item) => item != currentUser);

    await chatRef.collection('messages').add({
      'senderId': currentUser,
      'message': message,
      'createdAt': FieldValue.serverTimestamp(),
    });
    await chatRef.update({
      'lastMessage': message,
      'lastMessageTime': FieldValue.serverTimestamp(),
      'unreadMessages.$receiverId': FieldValue.increment(1),
    });
  }

  Stream<List<ChatModel>> getAllChatsForUser() {
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    final result = instance
        .collection('chats')
        .where('participants',arrayContains: currentUser)
        .snapshots()
        .map((snapshots) {
          return snapshots.docs.map((doc) {
            final data = doc.data();
            return ChatModel.fromFirebase(data: {...data, 'chatId': doc.id});
          }).toList();
        });
    return result;
  }

  Stream<List<MessageModel>> getAllMessages({required String chatId}) {
    final result = instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .map((snapShot) {
          return snapShot.docs.map((doc) {
            final data = doc.data();
            return MessageModel.fromFirebase(data: data);
          }).toList();
        });
    return result;
  }
}
