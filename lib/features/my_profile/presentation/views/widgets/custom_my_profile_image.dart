import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

class CustomMyProfileImage extends StatelessWidget {
  const CustomMyProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.imagesUserImage, width: 100),
        Positioned(
          top: 65,
          left: 68,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryPurple,
              shape: BoxShape.circle,
            ),
            child: FaIcon(
              FontAwesomeIcons.camera,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}