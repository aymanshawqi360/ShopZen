
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';

class CustomTextSpan extends StatelessWidget {
  final String fristText;
  final String lateText;
  final void Function()? onTap;
  final TextStyle?  fristStyle;
  final TextStyle?  lateStyle;
  const CustomTextSpan({
    super.key,
    required this.fristText,
    required this.lateText,
    this.onTap, this.fristStyle, this.lateStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style:lateStyle?? AppTextStyles.bodyLarge.copyWith(
                fontSize: AppSize.textSizeSp16,
                color:context.islight()? AppColors.primaryColor:AppColors.textWhite,
              ),  
              text: lateText,
            ),
          ],
          style:fristStyle?? AppTextStyles.bodyLarge.copyWith(
            fontSize: AppSize.textSizeSp17,
            color: AppColors.textGray,
            // context.isDark() ? AppColors.textGray : AppColors.textBlack,
          ),
          text: fristText,

        ),
      ),
    );
  }
}