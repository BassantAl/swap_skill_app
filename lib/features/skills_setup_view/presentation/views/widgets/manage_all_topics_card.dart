import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_active_item.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_inactive_item.dart';

class ManageAllTopicsCard extends StatelessWidget {
  const ManageAllTopicsCard({super.key, required this.isActive, this.onTap});

  final bool isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: isActive
            ? CategoriesActiveItem(text: 'All Topics')
            : CategoriesInactiveItem(text: 'All Topics'),
      ),
    );
  }
}
