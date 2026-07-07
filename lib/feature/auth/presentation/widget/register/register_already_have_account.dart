import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_span.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/feature/auth/presentation/screen/login/login_screen.dart';

class RegisterAlreadyHaveAccount extends StatelessWidget {
  const RegisterAlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH30,
        CustomTextSpan(
          onTap: () {
            // context.go(AppRoutes.login);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          fristText: context.l10n.alreadyHaveAccount,
          lateText: context.l10n.login,
        ),
        AppSize.gapH26,
      ],
    );
  }
}
