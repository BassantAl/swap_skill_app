import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_page_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/learn_skills.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/teach_skill_footer.dart';
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

            TeackSkillFooter(currentPage: currentPage, pageController: pageController),
          ],
        ),
      ),
    );
  }
}
