import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ChatWithUserModel {
  final GetUserInfoModel user;
  final ChatModel chat;
  ChatWithUserModel({required this.user, required this.chat});
}
