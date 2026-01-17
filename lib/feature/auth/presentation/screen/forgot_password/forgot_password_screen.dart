import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/circle_avatar_positioned.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/forgot_password/forgot_password_button.dart';
import 'package:shopzen/feature/auth/presentation/widget/forgot_password/forgot_password_field.dart';
import 'package:shopzen/feature/auth/presentation/widget/forgot_password/forgot_password_message.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CircleAvatarPositioned(),
          Padding(
            padding: AppSpacing.paddingL20R20,
            child: Column(
              children: [
                const ForgotPasswordMessage(),
                AppSize.gapH48,
                const ForgotPasswordField(),
                const ForgotPasswordButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
