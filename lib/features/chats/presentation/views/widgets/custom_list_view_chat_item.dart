import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/chats/data/models/chat_with_user_model.dart';

class CustomListViewChatItem extends StatefulWidget {
  const CustomListViewChatItem({super.key, required this.chatWithUserModel});
  final ChatWithUserModel chatWithUserModel;

  @override
  State<CustomListViewChatItem> createState() => _CustomListViewChatItemState();
}

class _CustomListViewChatItemState extends State<CustomListViewChatItem> {
  String get currentUserId => widget.chatWithUserModel.chat.unreadMessages.keys
      .firstWhere((id) => id != widget.chatWithUserModel.user.uid);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: AppDecoration.containerDecoration(),
      child: ListTile(
        leading: SvgPicture.asset(Assets.imagesUserImage),
        title: Text(
          widget.chatWithUserModel.user.fullName,
          style: AppStyles.semiBold20(context),
        ),
        subtitle: Text(
          widget.chatWithUserModel.chat.lastMessage,
          style: AppStyles.medium16(context),
        ),
        trailing:
            (widget.chatWithUserModel.chat.unreadMessages[currentUserId] ?? 0) >
                0
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryPurple,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${widget.chatWithUserModel.chat.unreadMessages[currentUserId]}' ,
                  style: AppStyles.medium16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              )
            : null,
      ),
    );
  }
}
