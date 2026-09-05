import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swap_skill/features/auth/presentation/views/widgets/social_login_section_item.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.read<LoginCubit>().signInWithGoogle();
          },
          child: SocialLoginSectionItem(
            child: SvgPicture.asset(Assets.imagesGoogleIcon),
          ),
        ),
      
        const Spacer(),
      ],
    );
  }
}
