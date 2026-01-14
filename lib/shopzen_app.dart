import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/routing/app_router.dart';
import 'package:shopzen/core/utils/app_theme.dart';
import 'package:shopzen/l10n/app_localizations.dart';

 //import 'l10n/app_localizations.dart';
//import 'package:your_app_name/l10n/app_localizations.dart';  // Adjust path as needed

class ShopzenApp extends StatelessWidget {
  const ShopzenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.designSize,
      minTextAdapt: AppConstants.minTextAdapt,
      splitScreenMode: AppConstants.splitScreenMode,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: AppConstants.debugShowCheckedModeBanner,
          // title: 'First Method',
          // You can use the library anywhere in the app even in theme
          localizationsDelegates:[
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Spanish
          ],
          theme: AppTheme.lightTheme,

          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: RoutGenerator.mainAppRouter,
        );
      },
      // child: const HomePage(title: 'First Method'),
    );
  }
}
