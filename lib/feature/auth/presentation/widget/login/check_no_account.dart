import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_span.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/feature/auth/presentation/screen/register_screen/register_screen.dart';

class CheckNoAccount extends StatelessWidget {
  const CheckNoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextSpan(
      onTap: () {
        // context.go(AppRoutes.register);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      fristText: context.l10n.noAccount,
      lateText: context.l10n.signUp,
    );
  }
}
