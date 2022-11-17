import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:players/app/injection.dart' as di;
import 'package:players/cubit/app_cubit.dart';

import '../config/theme_app.dart';
import '../core/utils/app_strings.dart';
import '../presentation/screens/add_players_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.instance<AppCubit>()..getAllPlayers(),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: appTheme(),
              home: const AddPlayersScreen(),
            );
          }),
    );
  }
}
