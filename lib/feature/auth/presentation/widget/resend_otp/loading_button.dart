import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class LoadingButton extends StatelessWidget {
  final Color color;
  const LoadingButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ResendOtpCubit, ResendOtpState, bool>(
      selector: (state) {
        return state is ResendOtpLoading;
      },
      builder: (context, state) {
        return state
            ? Transform.scale(
                scale: AppSize.progressIndicatorInLoadingState,
                child: CircularProgressIndicator(
                  strokeWidth: AppSize.progressIndicatorStrokeWidth,
                  backgroundColor: context.islight()
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
                ),
              )
            : Text(
                textAlign: TextAlign.center,
                context.l10n.continueButton,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeightHelper.bold,
                  fontSize: AppSize.textSizeSp13,
                  color: color,
                ),
              );
      },
    );
  }
}
