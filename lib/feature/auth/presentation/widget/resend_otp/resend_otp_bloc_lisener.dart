import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class ResendOtpBlocLisener extends StatelessWidget {
  const ResendOtpBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listenWhen: (previous, current) =>
          current is ResendOtpFailure ||
          current is ResendOtpSuccess ||
          current is ResendOtpLoading ,          
      listener: (context, state) {
        if (state is ResendOtpSuccess) {
          _buildSuccessState(context: context);
          return;
        }
        if (state is ResendOtpFailure) {
          _buildFailureState(context: context, state: state);
          return;
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _buildSuccessState({required BuildContext context}) {
    // context.go(AppRoutes.login);
  }

  void _buildFailureState({
    required BuildContext context,
    required ResendOtpFailure state,
  }) {
    AppDialog.showApiError(context, state.errorMessage);
  }
}
