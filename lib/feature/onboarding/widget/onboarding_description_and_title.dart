import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_strings.dart';
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
                  ),
                  
                ),
                 Text(
              textAlign: TextAlign.center,
              AppStrings.descriptionOnboarding,
              style: AppTextStyles.onboardingBody.copyWith(
                color: Color(0xff68656E),
                fontSize: AppSize.textSizeSp14,
              ),
            ),
              ],
            );
  }
}