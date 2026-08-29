import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/features/chats/presentation/manager/send_message/send_message_cubit.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ChatViewFooter extends StatefulWidget {
  const ChatViewFooter({
    super.key,
    required this.getUserInfoModel,
    required this.chatId,
  });

  final GetUserInfoModel getUserInfoModel;
  final String chatId;

  @override
  State<ChatViewFooter> createState() => _ChatViewFooterState();
}

class _ChatViewFooterState extends State<ChatViewFooter> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32,
        left: 16,
        right: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              onSubmitted: (value) async {
                await sendMessage(
                  value: value,
                  context: context,
                );

                messageController.clear();
              },
              decoration: AppDecoration.decorationForTextInputFeild(
                context: context,
                hintText: 'Write a Message',
              ),
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: () async {
              await sendMessage(
                value: messageController.text,
                context: context,
              );

              messageController.clear();
            },
            icon: const Icon(
              Icons.send,
              color: AppColors.lightPurple,
            ),
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

    await context.read<SendMessageCubit>().sendMessage(
      receiverId: widget.getUserInfoModel.uid,
      chatId: widget.chatId,
      message: message,
    );
  }
}