import 'package:flutter/widgets.dart';
import 'package:shopzen/core/common_ui/widgets/otp_code_text_field.dart';

class OtpFormScreen extends StatefulWidget {
  const OtpFormScreen({super.key});

  @override
  State<OtpFormScreen> createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {
  late TextEditingController _firstOtpController;
  late TextEditingController _secondOtpController;
  late TextEditingController _thirdOtpController;
  late TextEditingController _fourthOtpController;
  late TextEditingController _fifthOtpController;
  late TextEditingController _sixthOtpController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _firstOtpController = TextEditingController();
    _secondOtpController = TextEditingController();
    _thirdOtpController = TextEditingController();
    _fourthOtpController = TextEditingController();
    _fifthOtpController = TextEditingController();
    _sixthOtpController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }
  


  @override
  void dispose() {
    
    _firstOtpController.dispose();
    _secondOtpController.dispose();
    _thirdOtpController.dispose();
    _fourthOtpController.dispose();
    _fifthOtpController.dispose();
    _sixthOtpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtpCodeTextField(
            controller: _firstOtpController,
            lastNumber: false,
            fristNumber: true,
          ),
          OtpCodeTextField(
            controller: _secondOtpController,
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: _thirdOtpController,
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: _fourthOtpController,
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: _fifthOtpController,
            lastNumber: false,
            fristNumber: false,
          ),
          OtpCodeTextField(
            controller: _sixthOtpController,
            lastNumber: true,
            fristNumber: false,
          ),
        ],
      ),
    );
  }
}
