import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Bassant',
        'message': 'Can we start tomorrow?',
        'unreadMessages': 1,
      },
      {
        'name': 'Ahmed',
        'message': 'Are you available today?',
        'unreadMessages': 2,
      },
      {
        'name': 'Sara',
        'message': 'Thank you for your help.',
        'unreadMessages': 0,
      },
      {
        'name': 'Omar',
        'message': 'Let’s exchange skills.',
        'unreadMessages': 3,
      },
    ];

    return CustomChatsListView(chats: chats);
  }
}
