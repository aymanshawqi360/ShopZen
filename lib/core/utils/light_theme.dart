import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

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
      headlineLarge: AppTextStyles.headlineLarge.copyWith(),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(),

      headlineSmall: AppTextStyles.headlineSmall.copyWith(),
      titleLarge: AppTextStyles.titleLarge.copyWith(),

      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: AppColors.textBlack,
      ),

      titleSmall: AppTextStyles.titleSmall.copyWith(
        color: AppColors.lightBackground,
      ),

      bodySmall: AppTextStyles.bodySmall.copyWith(),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGray),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textBlack),
      //labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      foregroundColor: AppColors.textBlack,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBackground,
      contentPadding: AppSpacing.paddingH16V12,
      focusedBorder: themeFocusedBorder(),
      enabledBorder: themeEnabledBorder(),
      errorBorder: themeErrorBorder(),
      focusedErrorBorder: themeErrorBorder(),
      prefixIconColor: AppColors.textGray,
      hintStyle: AppTextStyles.titleLarge.copyWith(
        fontSize: AppSize.textSizeSp13,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.textGray,
      ),
    ),
    // iconTheme: const IconThemeData(
    //   color: AppColors.textGray,
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      // selectedItemColor: AppColors.primary,
      // unselectedItemColor: AppColors.gray3,
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
