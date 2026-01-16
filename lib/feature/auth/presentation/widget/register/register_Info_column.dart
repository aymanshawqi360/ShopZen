import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class RegisterInfoColumn extends StatelessWidget {
  const RegisterInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH84,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.createYourAccount,
              style: AppTextStyles.bodyLarge.copyWith(
                color: context.isDark()
                    ? AppColors.textWhite
                    : AppColors.textBlack,
                fontSize: AppSize.textSizeSp24,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              context.l10n.signUpMessage,
              style: AppTextStyles.bodyLarge.copyWith(
                color: context.isDark()
                    ? AppColors.textLight
                    : AppColors.textBlack,
                fontSize: AppSize.textSizeSp16,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
