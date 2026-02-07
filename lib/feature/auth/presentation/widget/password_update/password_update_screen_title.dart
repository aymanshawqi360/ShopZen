import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class PasswordUpdateScreenTitle extends StatelessWidget {
  const PasswordUpdateScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.createNewPassword,style: context.appTheme.textTheme.bodyMedium?.copyWith(
            fontSize: AppSize.textSizeSp27,
            color: context.isDark() ? AppColors.textWhite : AppColors.textDark,
            fontWeight: FontWeightHelper.bold
          )),
      ],
    );
  }
}