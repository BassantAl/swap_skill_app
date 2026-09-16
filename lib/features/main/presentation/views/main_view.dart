import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/home/presentation/manager/get_recommend_users_cubit/get_recommended_users_cubit.dart';
import 'package:swap_skill/features/main/presentation/views/widgets/main_mobile_layout.dart';
class MainView extends StatelessWidget {
  const MainView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
         
        BlocProvider(
          create: (context) => GetRecommendedUsersCubit(),
        ),
      ],
      child: AdaptiveLayoutWidget(
        mobileLayout: (context) {
          return MainMobileLayout(
            child: child,
          );
        },
        tabletLayout: (context) {
          return const SizedBox();
        },
        desktopLayout: (context) {
          return const SizedBox();
        },
      ),
    );
  }
}
