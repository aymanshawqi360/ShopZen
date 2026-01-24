import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/feature/onboarding/widget/onboarding_description_and_title.dart';
import 'package:shopzen/feature/onboarding/widget/onboarding_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [            
            AppSize.gapH16,
            OnboardingImage(),
            OnboardingDescriptionAndTitle(),
            CustomButton.text(
              text: context.l10n.onboardingGetStarted,
            ),
          ],
        ),
      ),
    );
  }
}
