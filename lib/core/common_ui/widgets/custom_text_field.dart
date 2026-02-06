import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? backgroundColor;
  final bool? isObscureText;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: context.isDark()
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      cursorHeight: AppSize.cursorHeight,
      decoration: InputDecoration(  
        filled: context.appTheme.inputDecorationTheme.filled,
        focusedBorder:
            focusedBorder ??
            context.appTheme.inputDecorationTheme.focusedBorder,
        enabledBorder:
            enabledBorder ??
            context.appTheme.inputDecorationTheme.enabledBorder,
        errorBorder: context.appTheme.inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            context.appTheme.inputDecorationTheme.focusedErrorBorder,
        hintStyle: hintStyle ?? context.appTheme.inputDecorationTheme.hintStyle,
        hintText: hintText ?? 'pixelshipon@gmail.com',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: isObscureText ?? false,
      validator: validator,
    );
  }
}
