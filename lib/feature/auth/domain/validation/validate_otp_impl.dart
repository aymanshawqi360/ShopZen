import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/feature/auth/domain/validation/i_validate_otp.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class ValidateOtpImpl implements IValidateOtp {
  static late List<TextEditingController> otpControllers;
  static late GlobalKey<FormState> formKey;
  @override
  void initController() {
    otpControllers = List.generate(6, (index) => TextEditingController());
    formKey = GlobalKey<FormState>();
  }

  @override
  void disposeController() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
  }

  @override
  void validateThenDoSignup({required BuildContext context}) {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    context.read<ResendOtpCubit>().resendOtp(
      otp: otpControllers.map((e) => e.text).join(),
    );
  }
}
