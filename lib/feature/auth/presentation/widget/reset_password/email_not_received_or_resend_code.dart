import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_span.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class EmailNotReceivedOrResendCode extends StatelessWidget {
  const EmailNotReceivedOrResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextSpan(
      onTap: () {
         context.read<ResendOtpCubit>().resetPassword();

      },
      fristText: context.l10n.emailNotReceived,
      fristStyle: AppTextStyles.bodySmall.copyWith(
        fontSize: AppSize.textSizeSp15,
        color: context.isDark() ? AppColors.griy400 : AppColors.griy900,
        fontWeight: FontWeightHelper.regular,
      ),
      lateText: context.l10n.resendCode,
      lateStyle: AppTextStyles.bodySmall.copyWith(
        fontSize: AppSize.textSizeSp15,
        color: AppColors.primaryColor,
        fontWeight: FontWeightHelper.bold,
      ),
    );
  }
}
