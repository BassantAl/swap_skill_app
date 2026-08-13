import 'package:flutter/material.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/main/presentation/views/widgets/main_mobile_layout.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayoutWidget(
      mobileLayout: (context) {
        return MainMobileLayout(child: child);
      },
      tabletLayout: (context) {
        return SizedBox();
      },
      desktopLayout: (context) {
        return SizedBox();
      },
    );
  }
}
