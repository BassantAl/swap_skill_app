
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class CustomChatsListView extends StatelessWidget {
  const CustomChatsListView({
    super.key,
    required this.chats,
  });

  final List<Map<String, Object>> chats;

  @override
  Widget build(BuildContext context) {
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