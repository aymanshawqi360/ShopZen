import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class ForgotPasswordMessage extends StatelessWidget {
  const ForgotPasswordMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           AppSize.gapH68,
            Text(
              context.l10n.forgotPassword2,
              style: AppTextStyles.bodyLarge.copyWith(
                color: context.isDark()
                    ? AppColors.textWhite
                    : AppColors.textDark,
                fontSize: AppSize.textSizeSp26,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            AppSize.gapH8,
            Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                maxWidth: AppSize.boxConstraintsMaxWidth,
              ),
              child: Text(
                context.l10n.forgotPasswordMessage,
                style: AppTextStyles.bodySmall.copyWith(
                  color: context.isDark()
                      ? AppColors.textWhite
                      : AppColors.griy1000,
                  fontSize: AppSize.textSizeSp13,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
      ],
    );
  }
}