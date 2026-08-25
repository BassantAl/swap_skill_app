import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';
import 'package:swap_skill/features/swaps/presentation/views/widgets/custom_accept_decline_button.dart';
import 'package:swap_skill/features/swaps/presentation/views/widgets/request_card_skills.dart';

class SkillSwapRequestCard extends StatelessWidget {
  const SkillSwapRequestCard({super.key, required this.requests});
  final SkillRequestWithSenderModel requests;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: SvgPicture.asset(Assets.imagesUserImage),
            title: Text(requests.sender.fullName, style: AppStyles.semiBold20(context)),
          ),
          SizedBox(height: 10),
          RequestCardSkills(
            title: 'WANT TO LEARN',
            skills: requests.sender.learnSkills,
            faIcon: FaIcon(
              FontAwesomeIcons.bookOpen,
              size: 12,
              color: AppColors.secondary,
            ),
          ),

          SizedBox(height: 10),
          RequestCardSkills(
            title: 'CAN TEACH',
           skills: requests.sender.teachSkills,
            faIcon: FaIcon(
              FontAwesomeIcons.chalkboardUser,
              size: 12,
              color: AppColors.primaryPurple,
            ),
          ),

          SizedBox(height: 15),

          CustomAcceptDeclineButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
