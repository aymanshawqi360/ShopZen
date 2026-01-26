import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';

class CustomHiddenTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final ColorFilter isDark;
  final String validatorName;

  const CustomHiddenTextField({
    super.key,
    this.controller,
    required this.isDark,
    required this.validatorName,
    required this.hintText,
  });

  @override
  State<CustomHiddenTextField> createState() => _CustomHiddenTextFieldState();
}

class _CustomHiddenTextFieldState extends State<CustomHiddenTextField> {
  late bool _isHidden;
  @override
  void initState() {
    _isHidden = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isObscureText: _isHidden,
      suffixIcon: GestureDetector(
        onTap: () => {
          setState(() {
            _isHidden = !_isHidden;
          }),
        },
        child: Icon(
          _isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        ),
      ),
      controller: widget.controller,
      hintText: widget.hintText,
      prefixIcon: Transform.scale(
        scale: AppSize.loginEmailSvg,

        child: CustomSvg(
          svgAsset: AppAssets.password,
          colorFilter: widget.isDark,
        ),
      ),

      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return widget.validatorName.toString();
        }
      },
    );
  }
}
