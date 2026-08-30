import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/core/routes/app_routes.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/features/chats/presentation/manager/create_chat/create_chat_cubit.dart';
import 'package:swap_skill/features/chats/presentation/manager/send_message/send_message_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/shared/get_all_friends/presentation/manager/cubit/get_all_freiends_cubit.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:swap_skill/firebase_options.dart';
import 'package:swap_skill/my_block_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
    Hive.registerAdapter(GetUserInfoModelAdapter());
     await Hive.openBox<GetUserInfoModel>('usersBox');
    await Hive.openBox('userBox');
  setupServiceLocator();
  Bloc.observer = MyBlockObserver();
  runApp(
    // DevicePreview(
    // enabled: true,
    // builder:(context)=> const MyApp())
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetUserInfoCubit()),
        BlocProvider(create: (context) => GetSkillsDataCubit()..getSkillsData()),
        BlocProvider(
          create: (context) => GetAllFreiendsCubit()..getAllFriends(),
        ),

         BlocProvider(
          create: (context) => CreateChatCubit()
        ),

         BlocProvider(
          create: (context) => SendMessageCubit()
        ),

         
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
        ),
      ),
    );
  }
}
