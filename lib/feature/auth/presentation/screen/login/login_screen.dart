import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_span.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/email_and_password.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/login_title.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/password_validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingL20R20B15,
          child: Column(
            children: [
              AppSize.gapH40,
              const LoginTitle(),
              const EmailAndPassword(),
              AppSize.gapH8,
              const PasswordValidation(),
              AppSize.gapH24,
              CustomButton(text: context.l10n.login),
              const Spacer(),
              CustomTextSpan(
                onTap: () {
                  context.go( AppRoutes.register);                              
                },
                fristText: context.l10n.noAccount,
                lateText: context.l10n.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
