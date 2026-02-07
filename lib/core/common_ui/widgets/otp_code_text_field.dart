import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class OtpCodeTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool lastNumber;
  final bool fristNumber;
  final String? Function(String?)? validator;
  const OtpCodeTextField({
    super.key,
    required this.controller,
    required this.lastNumber,
    required this.fristNumber,
    this.validator,
  });

  @override
  State<OtpCodeTextField> createState() => _OtpCodeTextFieldState();
}

class _OtpCodeTextFieldState extends State<OtpCodeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: AppSize.cursorHeight,
      textDirection: TextDirection.ltr,
      validator:
          widget.validator ??
          (String? value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
      controller: widget.controller,
      onChanged: (value) {
        if (value.isNotEmpty && widget.lastNumber == false) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty && widget.fristNumber == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: AppSize.textSizeSp16,
        fontWeight: FontWeightHelper.bold,
        color: context.isDark() ? AppColors.textWhite : AppColors.griy1000,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          height: AppSize.errorTextHeight,
          fontSize: AppSize.textSizeSp0,
        ),
        contentPadding: AppSpacing.paddingT10B10,
        border: InputBorder.none,
        constraints: BoxConstraints(maxWidth: 48.w),
      ),
    );
  }
}
