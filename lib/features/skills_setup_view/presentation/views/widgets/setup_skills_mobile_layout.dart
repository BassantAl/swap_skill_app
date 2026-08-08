import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_page_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skills_want_to_learn.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/setup_skills_footer.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skills.dart';

class SetupSkillsMobileLayout extends StatefulWidget {
  const SetupSkillsMobileLayout({super.key});

  @override
  State<SetupSkillsMobileLayout> createState() =>
      _SetupSkillsMobileLayoutState();
}

class _SetupSkillsMobileLayoutState extends State<SetupSkillsMobileLayout> {
  late final PageController pageController;
  int currentPage = 1;

  List<Widget> items = const [TeachSkills(), SkillsWantToLearn(), TeachSkills()];
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

            SetupSkillsFooter(currentPage: currentPage, pageController: pageController),
          ],
        ),
      ),
    );
  }
}
