import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/features/chats/presentation/manager/create_chat/create_chat_cubit.dart';
import 'package:swap_skill/features/chats/presentation/manager/send_message/send_message_cubit.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.getUserInfoModel});

  final GetUserInfoModel getUserInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(Assets.imagesUserImage, width: 40, height: 40),
            const SizedBox(width: 15),
            Text(
              getUserInfoModel.fullName[0].toUpperCase() +
                  getUserInfoModel.fullName.substring(1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) async {
                  sendMessage(value: value, context: context);
                },
                decoration: AppDecoration.decorationForTextInputFeild(
                  context: context,
                  hintText: 'Write a Message',
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.send, color: AppColors.lightPurple),
          ],
        ),
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
      receiverId: getUserInfoModel.uid,
    );

    await context.read<SendMessageCubit>().sendMessage(
      chatId: chatId,
      message: message,
    );
  }
}
