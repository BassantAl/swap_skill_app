import 'package:flutter/material.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/receive_message_widget.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/send_message_widget.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ManageMessages extends StatelessWidget {
  const ManageMessages({
    super.key,
    required this.messageModel,
    required this.receiverUser,
  });
  final MessageModel messageModel;
  final GetUserInfoModel receiverUser;
  @override
  Widget build(BuildContext context) {
    return messageModel.senderId == receiverUser.uid
        ? ReceiveMessageWidget(messageModel: messageModel)
        : SendMessageWidget(messageModel: messageModel);
  }
}
