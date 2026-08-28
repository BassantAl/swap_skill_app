import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/features/chats/presentation/manager/create_chat/create_chat_cubit.dart';
import 'package:swap_skill/features/chats/presentation/manager/send_message/send_message_cubit.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ChatViewFooter extends StatefulWidget {
  const ChatViewFooter({super.key, required this.getUserInfoModel});
  final GetUserInfoModel getUserInfoModel;
  @override
  State<ChatViewFooter> createState() => _ChatViewFooterState();
}

class _ChatViewFooterState extends State<ChatViewFooter> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              onSubmitted: (value) async {
                sendMessage(value: value, context: context);
                messageController.clear();
              },
              decoration: AppDecoration.decorationForTextInputFeild(
                context: context,
                hintText: 'Write a Message',
              ),
            ),
          ),
          SizedBox(width: 6),
          IconButton(
            onPressed: () {
              sendMessage(
                
                value: messageController.text.trim(),
                context: context,
              );
              messageController.clear();
            },
            icon: Icon(Icons.send, color: AppColors.lightPurple),
          ),
        ],
      ),
    );
  }

  Future<void> sendMessage({
    required String value,
    required BuildContext context,
  }) async {
    final message = value.trim();
    if (message.isEmpty) return;
    final chatId = await context.read<CreateChatCubit>().createChat(
      receiverId: widget.getUserInfoModel.uid,
    );

    await context.read<SendMessageCubit>().sendMessage(
      receiverId:widget.getUserInfoModel.uid ,
      chatId: chatId,
      message: message,
    );
  }
}
