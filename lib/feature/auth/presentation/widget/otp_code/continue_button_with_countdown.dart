import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class ContinueButtonWithCountdown extends StatelessWidget {
  const ContinueButtonWithCountdown({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = context.isDark() ? AppColors.textDark : AppColors.textWhite;
    return CustomButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            context.l10n.continueButton,
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: AppSize.textSizeSp16,
              fontWeight: FontWeightHelper.bold,
              color:color
            ),
          ),
          Text(
            " 59",
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: AppSize.textSizeSp16,
              fontWeight: FontWeightHelper.bold,
              color: color
            ),
          ),
        ],
      ),
    );
  }
}
