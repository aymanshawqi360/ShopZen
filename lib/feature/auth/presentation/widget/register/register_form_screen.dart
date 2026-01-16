import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';

class RegisterFormScreen extends StatelessWidget {
  const RegisterFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark=ColorFilter.mode(
                    context.isDark()
                        ? AppColors.griy400
                        : AppColors.darkBackground,
                    BlendMode.srcIn,
                  );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.gapH30,
        Text(context.l10n.firstName),
        AppSize.gapH8,
        CustomTextField(
          hintText: context.l10n.enterYourFirstName,
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.account,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),
        AppSize.gapH8,
        Text(context.l10n.lastName),
        AppSize.gapH8,
        CustomTextField(
          hintText: context.l10n.enterYourLastName,
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.account,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),
        AppSize.gapH8,
        Text(context.l10n.emailField),
        AppSize.gapH8,
         CustomTextField(
          hintText: context.l10n.enterYourEmail,
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.email,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),

        AppSize.gapH8,
        Text(context.l10n.passwordField),
        AppSize.gapH8,
         CustomTextField(
          hintText: context.l10n.enterYourPassword,
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.password,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),
       // ==== Confirm Password ====
        AppSize.gapH8,
        Text(context.l10n.confirmPassword),
        AppSize.gapH8,
         CustomTextField(
          hintText: context.l10n.enterYourConfirmPassword,
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.password,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),
        AppSize.gapH8,
        Text(context.l10n.phoneField),
        AppSize.gapH8,
         CustomTextField(
          hintText: 'xxx xxx xxxx',
          prefixIcon: Transform.scale(
            scale: AppSize.loginEmailSvg,

            child: CustomSvg(svgAsset: AppAssets.phone,colorFilter: isDark),
          ),

          validator: (String? p1) {},
        ),
      ],
    );
  }
}
