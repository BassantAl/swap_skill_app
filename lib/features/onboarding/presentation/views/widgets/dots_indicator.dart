import 'package:flutter/material.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_point.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentPageIndex, required this.itemCount});
  final int currentPageIndex;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CustomPoint(isActive: index == currentPageIndex),
        );
      }),
    );
  }
}
