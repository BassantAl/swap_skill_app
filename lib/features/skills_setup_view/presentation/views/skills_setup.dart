import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_skills_cubit_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills_mobile_layout.dart';

class SkillsSetup extends StatelessWidget {
  const SkillsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => GetSkillsDataCubit()..getSkillsData(),),
      BlocProvider(
      create: (context) => SelectedSkillsCubit(),),
      ],
      child: Scaffold(
        body: AdaptiveLayoutWidget(
          mobileLayout: (context) => TeachSkillsMobileLayout(),
          tabletLayout: (context) => SizedBox(),
          desktopLayout: (context) => SizedBox(),
        ),
      ),
    );
  }
}

  // CircleAvatar(
              //   backgroundColor: AppColors.neutral,
              //   radius: 23,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(60),
                  
              //     child: Image.asset(Assets.imagesAppLogo2, width: 45),
              //   ),
              // ),