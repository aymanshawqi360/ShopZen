import 'package:flutter/widgets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class OtpCodeAndMessageText extends StatelessWidget {
  const OtpCodeAndMessageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.enter4DigitCode,
          style: context.appTheme.textTheme.bodyLarge?.copyWith(
            fontSize:AppSize.textSizeSp25, 
            
            fontWeight: FontWeightHelper.bold,
            color: context.isDark() ? AppColors.textWhite : AppColors.textDark,
          ),
        ),
        Text(
          context.l10n.enter4DigitCodeMessage,
          style: context.appTheme.textTheme.bodySmall?.copyWith(
            fontSize: AppSize.textSizeSp14,
            fontWeight: FontWeightHelper.regular,
            color: context.isDark() ? AppColors.textWhite : AppColors.griy900,
          ),
        ),
      ],
    );
  }
}
