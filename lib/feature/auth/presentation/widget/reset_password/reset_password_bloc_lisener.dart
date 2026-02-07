import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class ResetPasswordBlocLisener extends StatelessWidget {
  const ResetPasswordBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordFailure ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordLoading,

      listener: (context, state) {
        
        if (state is ResetPasswordSuccess) {
          context.read<ResendOtpCubit>().startTimer();
          _buildSuccessState(context: context);
          return;
        }
        if (state is ResetPasswordFailure) {
          _buildFailureState(context: context, state: state);
          return;
        }
      },
      child: SizedBox.shrink(),
    );
  }

    void _buildSuccessState({required BuildContext context}) {
    
  }

  void _buildFailureState({
    required BuildContext context,
    required ResetPasswordFailure state,
  }) {
    AppDialog.showApiError(context, state.errorMessage);
  }
}
