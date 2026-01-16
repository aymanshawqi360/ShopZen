import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

ThemeData buildDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryColor,

    cardColor: AppColors.darkBackground,
    //cardColor: const Color(0xFF0D0D0D), // #0D0D0D

    // colorScheme: const ColorScheme.dark(
    //   primary: AppColors.primary,

    //   secondary: AppColors.orangeDark,
    //   //secondary: AppColors.secondary,
    //   background: AppColors.darkBackground,
    //   surface: AppColors.darkSurface,
    //   onSurface: AppColors.textWhite,
    //   onPrimary: Colors.white,
    //   onSecondary: Colors.white,
    // ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(
        color: AppColors.textWhite,
      ),
      displayMedium: AppTextStyles.displayMedium.copyWith(
        color: AppColors.textWhite,
      ),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.textWhite,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.textWhite,
      ),

      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.textWhite,
      ),
      // titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.textWhite),

      // titleMedium:
      //     AppTextStyles.titleMedium.copyWith(color: AppColors.textWhiteSoft),
      // titleSmall:
      //     AppTextStyles.titleSmall.copyWith(color: AppColors.textWhite),
      // bodyLarge:
      //     AppTextStyles.bodyLarge.copyWith(color: AppColors.textWhiteSoft),
      // bodyMedium:
      //     AppTextStyles.bodyMedium.copyWith(color: AppColors.textWhiteSoft),
      // bodySmall:
      //     AppTextStyles.bodySmall.copyWith(color: AppColors.textGrayDark),
      // labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.textWhite),
      // labelMedium:
      //     AppTextStyles.labelMedium.copyWith(color: AppColors.textWhite),
      // labelSmall:
      //     AppTextStyles.labelSmall.copyWith(color: AppColors.textGrayDark),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      foregroundColor: AppColors.textWhite,
      centerTitle: true,
      titleTextStyle: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.textWhite,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkBackground,
      focusedBorder: themeFocusedBorder(),
      enabledBorder: themeEnabledBorder(),
      errorBorder: themeErrorBorder(),
      focusedErrorBorder: themeErrorBorder(),
      hintStyle: AppTextStyles.titleLarge.copyWith(
        fontSize: AppSize.textSizeSp13,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.textGray,
      ),
    ),

    // iconTheme: const IconThemeData(
    //   color: AppColors.textWhiteSoft,
    // ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF0D0D0D),
      //selectedItemColor: AppColors.primary,
      //unselectedItemColor: AppColors.textGrayDark,
    ),
  );
}

OutlineInputBorder themeErrorBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.alertError500,
      width: AppSize.width1,
    ),
    borderRadius: AppSpacing.borderRadius8,
  );
}

OutlineInputBorder themeFocusedBorder() {
  return OutlineInputBorder(
    borderRadius: AppSpacing.borderRadius8,

    borderSide: BorderSide(color: Color(0xff6a70ff), width: AppSize.width1),
  );
}
OutlineInputBorder themeEnabledBorder() {
  return OutlineInputBorder(
    borderRadius: AppSpacing.borderRadius8,

    borderSide: BorderSide(color: AppColors.griy500, width: AppSize.width1),
  );
}
