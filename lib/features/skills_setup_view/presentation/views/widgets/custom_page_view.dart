
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.items,
    required this.pageController, this.onPageChanged,
  });

  final List<Widget> items;
  final PageController pageController;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  16.0 ),
      child: ExpandablePageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
