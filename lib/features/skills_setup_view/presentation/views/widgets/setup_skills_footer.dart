
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_skills_cubit_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/active_skill_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_setup_skill_button.dart';

class SetupSkillsFooter extends StatelessWidget {
  const SetupSkillsFooter({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          
          Visibility(
            visible: currentPage == 1,
            child: BlocBuilder<SelectedSkillsCubit, List<String>>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ActiveSkillCard(
                              text: e,
                              widget: GestureDetector(
                                onTap: () {
                                  context
                                      .read<SelectedSkillsCubit>()
                                      .removeSkill(e);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ManageSetupSkillsButton(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}
