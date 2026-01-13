import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_strings.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';

class OnboardingDescriptionAndTitle extends StatelessWidget {
  const OnboardingDescriptionAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
              children: [
                Text(
                  AppStrings.welcomeOnboarding,
                  style: AppTextStyles.onboardingLarge.copyWith(
                    fontSize: AppSize.textSizeSp28,
                    color: context.isDark()? AppColors.textWhite:AppColors.textBlack
                  ),
                  
                ),
                 Text(
              textAlign: TextAlign.center,
              AppStrings.descriptionOnboarding,
              style: AppTextStyles.onboardingBody.copyWith(
                color:context.isDark()?                 
                 AppColors.griy650
                : AppColors.griy800,
                fontSize: AppSize.textSizeSp14,
              ),
            ),
              ],
            );
  }
}