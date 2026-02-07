import 'package:flutter/material.dart';

abstract class IValidateOtp {
  void initController();
  void disposeController();
  void validateThenDoSignup({required BuildContext context});
}
