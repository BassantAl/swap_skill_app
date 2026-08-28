import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/features/chats/presentation/views/widgets/chat_view_footer.dart';
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
      bottomNavigationBar: ChatViewFooter(getUserInfoModel: getUserInfoModel)
    );
  }
}
