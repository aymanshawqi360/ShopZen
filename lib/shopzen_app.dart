import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/routing/app_router.dart';
import 'package:shopzen/core/utils/app_theme.dart';

class ShopzenApp extends StatelessWidget {
  const ShopzenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.designSize,
      minTextAdapt:  AppConstants.minTextAdapt,
      splitScreenMode: AppConstants.splitScreenMode,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
          // title: 'First Method',
          // You can use the library anywhere in the app even in theme

          theme: AppTheme.darkTheme,
          
          darkTheme: AppTheme.lightTheme,
          themeMode: ThemeMode.system,
          routerConfig: RoutGenerator.mainAppRouter,
        );
      },
     // child: const HomePage(title: 'First Method'),
    );
  }
}