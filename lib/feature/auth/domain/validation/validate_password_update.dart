import 'package:flutter/material.dart';
import 'package:shopzen/feature/auth/domain/validation/i_validate_otp.dart';

class ValidatePasswordUpdate implements IValidateOtp {
  static late TextEditingController newPasswordController;
  static late TextEditingController confirmPasswordController;
  static late GlobalKey<FormState> formKey;
  @override
  void disposeController() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void initController() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void validateThenDoSignup({required BuildContext context}) {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;
  }
}
