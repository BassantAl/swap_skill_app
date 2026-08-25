import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/swaps/presentation/manager/cubit/get_all_requests_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/views/widgets/skill_swap_request_card.dart';

class SkillswaprequestListView extends StatelessWidget {
  const SkillswaprequestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllRequestsCubit, GetAllRequestsState>(
      builder: (context, state) {
        if (state is GetAllRequestsSuccess) {
          log('${state.requests.length}');
          return ListView.builder(
            itemCount: state.requests.length,
            itemBuilder: (context, index) {
              
              return SkillSwapRequestCard(requests: state.requests[index]);
            },
          );
        }

        if (state is GetAllRequestsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetAllRequestsFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
