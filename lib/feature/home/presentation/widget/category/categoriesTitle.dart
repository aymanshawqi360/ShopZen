import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/constants/app_strings.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class Categoriestitle extends StatelessWidget {
  const Categoriestitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingL20R20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.categories,
            style: context.appTheme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeightHelper.semiBold,
              fontSize: AppSize.textSizeSp16,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.textDark,
              fontFamily: AppStrings.satoshiFont,
            ),
          ),

          Text(
            AppStrings.viewAll,
            style: context.appTheme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeightHelper.regular,
              fontSize: AppSize.textSizeSp12,
              color: context.islight()
                  ? AppColors.griy900
                  : AppColors.primaryColor,
              fontFamily: AppStrings.satoshiFont,
            ),
          ),
        ],
      ),
    );
  }
}
