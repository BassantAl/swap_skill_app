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

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: AppDecoration.containerDecoration(),
          child: ListTile(
            leading: SvgPicture.asset(
              Assets.imagesUserImage,
            ),
            title: Text(
              chat['name'] as String,
              style: AppStyles.semiBold20(context),
            ),
            subtitle: Text(
              chat['message'] as String,
              style: AppStyles.medium16(context),
            ),
            trailing: (chat['unreadMessages'] as int) > 0
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat['unreadMessages']}',
                      style: AppStyles.medium16(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}