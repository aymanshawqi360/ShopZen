import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.emailField,style:  AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp13,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.griy1000,
            ),),
        AppSize.gapH8,
        CustomTextField(
          validator: (String? p1) {},
          hintText: context.l10n.enterYourEmail,
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
      ],
    );
  }
}
