import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';


ThemeData buildLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryColor,
    // cardColor: AppColors.lightSurface,
    // colorScheme: const ColorScheme.light(
    //   primary: AppColors.primary,
    //   secondary: AppColors.secondary,
    //   surface: AppColors.lightSurface,
    //   onSurface: AppColors.textBlack,
    //   onPrimary: Colors.white,
    //   onSecondary: Colors.white,
    // ),
    textTheme: TextTheme(
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(),
          
      headlineSmall: AppTextStyles.headlineSmall.copyWith(),
      titleLarge: AppTextStyles.titleLarge.copyWith(),

      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.textBlack),
      
      
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: AppColors.lightBackground),

      bodySmall:
          AppTextStyles.bodySmall.copyWith(),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGray),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textBlack),
      //labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      foregroundColor: AppColors.textBlack,
    ),
    // iconTheme: const IconThemeData(
    //   color: AppColors.textGray,
    // ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      // selectedItemColor: AppColors.primary,
      // unselectedItemColor: AppColors.gray3,
    ),
  );
}