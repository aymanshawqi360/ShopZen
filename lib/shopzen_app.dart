import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/routing/app_router.dart';

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
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // ),
          routerConfig: RoutGenerator.mainAppRouter,
        );
      },
     // child: const HomePage(title: 'First Method'),
    );
  }
}