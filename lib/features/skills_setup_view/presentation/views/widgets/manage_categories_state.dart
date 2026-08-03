import 'package:flutter/material.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_active_item.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_inactive_item.dart';

class ManageCategoriesStates extends StatelessWidget {
  const ManageCategoriesStates({
    super.key,
    required this.selectedCategoryIndex,
    this.onTap, required this.name, required this.isActive,
  });

  final int selectedCategoryIndex;
  final Function()? onTap;
  final String name;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: isActive
            ? CategoriesActiveItem(text: name)
            : CategoriesInactiveItem(text: name),
      ),
    );
  }
}
