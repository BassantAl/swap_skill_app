import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String chatId;
  final List<String> participants;
  final Map<String, int> unreadMessages;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChatModel({
    required this.participants,
    required this.unreadMessages,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.chatId,
  });

  factory ChatModel.fromFirebase({
  required Map<String, dynamic> data,
}) {
  return ChatModel(
    chatId: data['chatId'] as String,
    participants: List<String>.from(
      data['participants'] ?? [],
    ),
    unreadMessages: Map<String, int>.from(
      data['unreadMessages'] ?? {},
    ),
    lastMessage: data['lastMessage'] ?? '',
    lastMessageTime: data['lastMessageTime'] != null
        ? (data['lastMessageTime'] as Timestamp).toDate()
        : DateTime.now(),
  );
}
  
}

class MessageModel {
  final String senderId;
  final String message;
  final DateTime? createdAt;

  MessageModel({
    required this.senderId,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromFirebase({required Map<String, dynamic> data}) {
    return MessageModel(
      senderId: data['senderId'],
      message: data['message'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
