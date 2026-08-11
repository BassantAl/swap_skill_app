import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/constants/assets.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/main/presentation/views/widgets/custom_buttom_navigation.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.child});
  final Widget child;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String get currentRoute => GoRouterState.of(context).uri.path;
  int getCurrentIndex(String route) {
    if (route == AppRoutes.homeView) return 0;
    if (route == AppRoutes.searchView) return 1;
    if (route == AppRoutes.swapsView) return 2;
    if (route == AppRoutes.chatsView) return 3;
    if (route == AppRoutes.profileView) return 4;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(Assets.imagesBaseImage),
            const SizedBox(width: 10),
            Text('Skill Swap', style: AppStyles.bold28(context)),
          ],
        ),
        actions: [Icon(Icons.notifications), SizedBox(width: 10)],
      ),
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: getCurrentIndex(currentRoute),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRoutes.homeView);
              break;

            case 1:
              context.go(AppRoutes.searchView);
              break;

            case 2:
              context.go(AppRoutes.swapsView);
              break;

            case 3:
              context.go(AppRoutes.chatsView);
              break;

            case 4:
              context.go(AppRoutes.profileView);
              break;
          }
        },
      ),
    );
  }
}
