import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/common_ui/widgets/otp_code_text_field.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_user_Iinputs.dart';

class ResendOtpFormScreen extends StatefulWidget {
  const ResendOtpFormScreen({super.key});

  @override
  State<ResendOtpFormScreen> createState() => _ResendOtpFormScreenState();
}

class _ResendOtpFormScreenState extends State<ResendOtpFormScreen> {
  @override
  void initState() {
    super.initState();
    ValidateUserIinputs.initController();
  }

  @override
  void dispose() {
    super.dispose();

    ValidateUserIinputs.disposeController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ValidateUserIinputs.formKey,
      child: Row(
        spacing: 3.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[0],
            lastNumber: false,
            fristNumber: true,
          ),
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[1],
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[2],
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[3],
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[4],
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: ValidateUserIinputs.otpControllers[5],
            lastNumber: true,
            fristNumber: false,
          ),
        ],
      ),
    );
  }
}
