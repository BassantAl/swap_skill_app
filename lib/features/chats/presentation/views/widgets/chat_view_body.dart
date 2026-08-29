import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/chats/presentation/manager/get_all_messages/get_all_messages_cubit.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/manage_messages.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.receiverUser});
  final GetUserInfoModel receiverUser;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.hasClients) return;
       controller.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllMessagesCubit, GetAllMessagesState>(
      listener: (context, state) {
        if (state is GetAllMessagesSuccess) {
          _scrollToBottom();
        }
      },
      child: BlocBuilder<GetAllMessagesCubit, GetAllMessagesState>(
        builder: (context, state) {
          if (state is GetAllMessagesSuccess) {
            return ListView.builder(
              reverse: true,
              controller: controller,
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final message =
        state.messages[state.messages.length - 1 - index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ManageMessages(
                    messageModel: message,
                    receiverUser: widget.receiverUser,
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
