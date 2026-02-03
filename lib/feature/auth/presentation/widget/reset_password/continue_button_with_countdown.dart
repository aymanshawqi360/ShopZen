import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_user_Iinputs.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/loading_button.dart';

class ContinueButtonWithCountdown extends StatelessWidget {
  final void Function()? onPressed;

  const ContinueButtonWithCountdown({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color color = context.isDark() ? AppColors.textDark : AppColors.textWhite;
    return BlocBuilder<ResendOtpCubit, ResendOtpState>(
      buildWhen: (previous, current) =>
          current is ResendOtpCounter ||
          current is IsButtonDisabled ||
          current is ResendOtpLoading,
      builder: (context, state) {
        final isLoading = context.read<ResendOtpCubit>().isButtonDisabled;

        return Opacity(
          opacity: (isLoading)
              ? AppSize.transparencyIsOnePercent
              : AppSize.transparencyIsFivePercent,
          child: AbsorbPointer(
            absorbing: (isLoading) ? false : true,
            child: CustomButton(
              onPressed:
                  onPressed ??
                  () {
                    log(isLoading.toString());
                    log("ValidateUserIinputs.otp(context: context);");
                    ValidateUserIinputs.otp(context: context);
                  },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingButton(color: color),
                  Text(
                    countdownText(state: state),
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: AppSize.textSizeSp13,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String countdownText({required ResendOtpState state}) {
    if (state is ResendOtpCounter) {
      return '\t${state.counter}';
    }
    return '';
  }
}
