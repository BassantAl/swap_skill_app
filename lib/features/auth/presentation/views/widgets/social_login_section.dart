import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/social_login_section_item.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
         SocialLoginSectionItem(child: SvgPicture.asset(Assets.imagesGoogleIcon),),
         const SizedBox(width: 15,),
         const SocialLoginSectionItem(child: FaIcon(FontAwesomeIcons.apple)),
         const SizedBox(width: 15,),
         const SocialLoginSectionItem(child: FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,)),
        const Spacer(),
      ],
    );
  }
}
