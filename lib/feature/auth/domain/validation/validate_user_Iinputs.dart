import 'package:flutter/material.dart';
import 'package:shopzen/feature/auth/domain/validation/i_validate_otp.dart';

class ValidateUserIinputs {
  ValidateUserIinputs._();
  static GlobalKey<FormState> formKey({required GlobalKey<FormState> formKey}) {
    return formKey;
  }

  static TextEditingController otpControllers({
    required TextEditingController otpControllers,
  }) {
    return otpControllers;
  }

  static void initController({required IValidateOtp controller}) {
    controller.initController();
  }

  static void disposeController({required IValidateOtp disposeController}) {
    disposeController.disposeController();
  }

  static void validateThenDoSignup({
    required IValidateOtp validateThenDoSignup,
    required BuildContext context,
  }) {
    validateThenDoSignup.validateThenDoSignup(context: context);
  }
}
