import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/swaps/presentation/manager/accept_request_cubit/accept_request_cubit_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/manager/cubit/get_all_requests_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/manager/decline_request_cubit/decline_request_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/views/widgets/skill_swap_request_list_view.dart';
class SwapsView extends StatelessWidget {
  const SwapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
         create: (context) => GetAllRequestsCubit()..getAllRequests(),
        ),
        BlocProvider(
          create: (context) => AcceptRequestCubit(),
        ),

         BlocProvider(
          create: (context) => DeclineRequestCubit(),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Swaps',
            style: AppStyles.semiBold24(context),
          ),

          Text(
            'Manage your skill exchange connections',
            style: AppStyles.medium16(context),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SkillswaprequestListView(),
          ),
        ],
      ),
    );
  }
}