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
    return Column(
      children: [
        Container(
          decoration: AppDecoration.containerDecoration(),
          child: ListTile(
            leading: SvgPicture.asset(Assets.imagesUserImage),
            title: Text('Bassant',style: AppStyles.semiBold20(context),),
            subtitle: Text('Can we start tomorrow?',style: AppStyles.medium16(context),),
            trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle
              ),
              child: Text('1',style: AppStyles.medium16(context).copyWith(color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }
}