import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
              Expanded(
                child: Text(
                  context.l10n.loginWithEmail,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: AppSize.textSizeSp22,
                    fontWeight: FontWeightHelper.bold,
                    color: context.isDark()
                        ? AppColors.textWhite
                        : AppColors.textBlack,
                  ),
                ),
              ),
    ],);
  }
}