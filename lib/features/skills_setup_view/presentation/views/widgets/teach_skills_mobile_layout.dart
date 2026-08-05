import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_skills_cubit_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/active_skill_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_page_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/learn_skills.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_setup_skill_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills.dart';

class TeachSkillsMobileLayout extends StatefulWidget {
  const TeachSkillsMobileLayout({super.key});

  @override
  State<TeachSkillsMobileLayout> createState() =>
      _TeachSkillsMobileLayoutState();
}

class _TeachSkillsMobileLayoutState extends State<TeachSkillsMobileLayout> {
  late final PageController pageController;
  int currentPage = 1;

  List<Widget> items = const [TeachSkills(), LearnSkills(), TeachSkills()];
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(currentPage: currentPage, totalPages: items.length),
            SizedBox(height: 10),
            CustomPageView(
              items: items,
              pageController: pageController,
              onPageChanged: (value) {
                currentPage = value + 1;
                setState(() {});
              },
            ),

            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
