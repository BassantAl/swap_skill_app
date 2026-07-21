
import 'package:flutter/material.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';

void main() {
  runApp(//DevicePreview(
    // enabled: true,
    // builder:(context)=> const MyApp())
    const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
     routerConfig: AppRoutes.router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor
      ),
    );
  }
}
