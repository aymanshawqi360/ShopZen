import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSvg(
      svgAsset: AppAssets.onboarding,
      svgWidth: AppSize.onboardingIconSvgWidth,
      svgHeight: AppSize.onboardingIconSvgHeight,
    );
  }
}
