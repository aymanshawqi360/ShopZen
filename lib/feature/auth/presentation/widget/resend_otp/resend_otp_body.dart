import 'package:flutter/widgets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/reset_password/continue_button_with_countdown.dart';
import 'package:shopzen/feature/auth/presentation/widget/reset_password/email_not_received_or_resend_code.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/resend_otp_and_message_text.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/resend_otp_form_screen.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/resend_otp_bloc_lisener.dart';
import 'package:shopzen/feature/auth/presentation/widget/reset_password/reset_password_bloc_lisener.dart';

class ResendOtpBody extends StatelessWidget {
  const ResendOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingT80L24R24,
      child: Column(
        children: [
          const ResendOtpAndMessageText(),
          AppSize.gapH48,
          const ResendOtpFormScreen(),
          AppSize.gapH48,
          const EmailNotReceivedOrResendCode(),
          AppSize.gapH48,
          const ContinueButtonWithCountdown(),
          const ResendOtpBlocLisener(),
          const ResetPasswordBlocLisener(),
        ],
      ),
    );
  }
}
