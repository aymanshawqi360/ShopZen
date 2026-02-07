import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/core/utils/theme_borders.dart';

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
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.textWhite),

      titleMedium:
          AppTextStyles.titleMedium.copyWith(color: AppColors.textWhite),
      titleSmall:
          AppTextStyles.titleSmall.copyWith(color: AppColors.textWhite),
      bodyLarge:
          AppTextStyles.bodyLarge.copyWith(color: AppColors.textWhite),
      bodyMedium:
          AppTextStyles.bodyMedium.copyWith(color: AppColors.textWhite),
      bodySmall:
          AppTextStyles.bodySmall.copyWith(color: AppColors.textWhite),
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
      isDense: true,
      filled: true,
      fillColor: Colors.transparent,
      errorStyle: const TextStyle(height: 1),
      contentPadding:AppSpacing.paddingH16V12,
      focusedBorder:ThemeDefaultBorder.outlineInputBorder(ThemeFocusedBorder()),
      enabledBorder: ThemeDefaultBorder.outlineInputBorder(
          ThemeEnabledBorder()),
      errorBorder:ThemeDefaultBorder.outlineInputBorder(ThemeErrorBorder()),
      focusedErrorBorder: ThemeDefaultBorder.outlineInputBorder(ThemeErrorBorder()),
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
