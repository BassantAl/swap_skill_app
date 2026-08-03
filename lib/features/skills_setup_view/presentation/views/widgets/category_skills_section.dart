import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/skill_card.dart';

class CategorySkillsSection extends StatelessWidget {
  const CategorySkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.38,
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Programming', style: AppStyles.semiBold24(context)),
                    const SizedBox(height: 15),
                    CustomSkillsGridView(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomSkillsGridView extends StatefulWidget {
  const CustomSkillsGridView({super.key});

  @override
  State<CustomSkillsGridView> createState() => _CustomSkillsGridViewState();
}

class _CustomSkillsGridViewState extends State<CustomSkillsGridView> {
  List<bool> selected = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //number of elements in row
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            
            setState(() {
              selected[index] =! selected[index];
            });
          },
          child: SkillCard(isActive:selected[index] ),
        );
      },
    );
  }
}
