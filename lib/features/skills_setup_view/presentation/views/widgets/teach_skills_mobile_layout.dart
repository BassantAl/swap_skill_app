import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/cubit/selected_skills_cubit_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/active_skill_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_page_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/learn_skills.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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

              Row(
                children: context.read<SelectedSkillsCubit>().state.map((e)=>ActiveSkillCard(text: e)).toList(),
              ),

              ManageSetupSkillsButton(pageController: pageController ,currentPage: currentPage,),
            ],
          ),
        ),
      ),
    );
  }
}

class ManageSetupSkillsButton extends StatelessWidget {
  const ManageSetupSkillsButton({super.key, required this.pageController, required this.currentPage});

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 1) {
      return GestureDetector(
        onTap: nevigateToNextPageView,
        child: CustomNextButton(text: 'Next'),
      );
    }
    return Row(
      children: [
        Expanded(child: GestureDetector(
          onTap:nevigateToNextPreviousView ,
          child: CustomBackButton(text: 'Back'))),
        SizedBox(width: 15),
        Expanded(child: GestureDetector(
          onTap: nevigateToNextPageView,
          child: CustomNextButton(text: 'Next'))),
      ],
    );
  }

  void nevigateToNextPageView() {
    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void nevigateToNextPreviousView() {
    pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
