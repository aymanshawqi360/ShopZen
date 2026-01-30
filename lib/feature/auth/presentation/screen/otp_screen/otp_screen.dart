import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/otp_code/email_not_received_or_resend_code.dart';
import 'package:shopzen/feature/auth/presentation/widget/otp_code/continue_button_with_countdown.dart';
import 'package:shopzen/feature/auth/presentation/widget/otp_code/otp_code_and_message_text.dart';
import 'package:shopzen/feature/auth/presentation/widget/otp_code/otp_form_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingT68L24R24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OtpCodeAndMessageText(),
              AppSize.gapH48,
              const OtpFormScreen(),
              AppSize.gapH48,
              const EmailNotReceivedOrResendCode(),
              AppSize.gapH48,
              const ContinueButtonWithCountdown(),
            ],
          ),
        ),
      ),
    );
  }
}
