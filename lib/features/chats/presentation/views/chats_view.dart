import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/chats/presentation/manager/get_all_chats_for_user/get_all_chats_for_user_cubit.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/custom_chats_list_view.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllChatsForUserCubit()..getAllChatsForUser(),
        ),
       
      ],
      child:  CustomChatsListView(),
    );
  }
}
