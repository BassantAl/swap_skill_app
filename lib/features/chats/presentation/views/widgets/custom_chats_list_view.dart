import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/features/chats/presentation/manager/get_all_chats_for_user/get_all_chats_for_user_cubit.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/custom_list_view_chat_item.dart';

class CustomChatsListView extends StatelessWidget {
  const CustomChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllChatsForUserCubit, GetAllChatsForUserState>(
      builder: (context, state) {
        if (state is GetAllChatsForUserSuccess) {
          log(state.chats.length.toString());
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRoutes.chatView,
                      extra: {
                        'user': state.chats[index].user,
                        'chatId': state.chats[index].chat.chatId,
                      },
                    );
                  },
                  child: CustomListViewChatItem(
                    chatWithUserModel: state.chats[index],
                  ),
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
