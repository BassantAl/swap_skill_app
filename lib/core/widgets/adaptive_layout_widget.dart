import 'package:flutter/material.dart';
import 'package:swap_skill/core/utils/size_config.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  const AdaptiveLayoutWidget({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tablet) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < SizeConfig.desktop) {
          return tabletLayout(context);
        }
        return desktopLayout(context);
      },
    );
  }
}
