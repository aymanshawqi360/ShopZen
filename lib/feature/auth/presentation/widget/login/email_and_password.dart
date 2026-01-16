import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             AppSize.gapH48,
              Text(
                context.l10n.emailField,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: AppSize.textSizeSp13,
                  color: context.isDark()
                      ? AppColors.textWhite
                      : AppColors.textBlack,
                ),
              ),
          AppSize.gapH4,
          CustomTextField(
            hintText: context.l10n.enterYourEmail,
            validator: (String? p1) {},
            prefixIcon: Padding(
              padding: AppSpacing.paddingT5,
              child: Transform.scale(
                scale: AppSize.loginEmailSvg,
                alignment: Alignment.center,
                child: CustomSvg(
                  svgAsset: AppAssets.email,
                  colorFilter: ColorFilter.mode(
                    context.isDark()
                        ? AppColors.griy400
                        : AppColors.darkBackground,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          AppSize.gapH18,
          Text(
            context.l10n.passwordField,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp13,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.textBlack,
            ),
          ),
          AppSize.gapH4,
          CustomTextField(
            hintText: context.l10n.enterYourPassword,
            validator: (String? p1) {},
            prefixIcon: Padding(
              padding: AppSpacing.paddingT5,
              child: Transform.scale(
                scale: AppSize.loginEmailSvg,
                alignment: Alignment.center,
                child: CustomSvg(
                  svgAsset: AppAssets.password,
                  colorFilter: ColorFilter.mode(
                    context.isDark()
                        ? AppColors.griy400
                        : AppColors.darkBackground,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
