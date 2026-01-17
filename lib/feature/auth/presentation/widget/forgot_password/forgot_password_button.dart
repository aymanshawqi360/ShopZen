import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH48,
        CustomButton(text: context.l10n.forgotPasswordContinue),
      ],
    );
  }
}