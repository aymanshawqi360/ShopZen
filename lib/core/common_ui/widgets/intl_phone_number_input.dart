
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

class CustomPhoneNumberField extends StatefulWidget {
  final TextEditingController? controller;
  

  const CustomPhoneNumberField({super.key, this.controller});

  @override
  State<CustomPhoneNumberField> createState() => _CustomPhoneNumberFieldState();
}

class _CustomPhoneNumberFieldState extends State<CustomPhoneNumberField> {
  late FocusNode _focusNode;
  

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: AppConstants.phoneNumbeInput);
  
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
   

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: 
      (PhoneNumber number) {
        context.read<RegisterCubit>().getCountryCode(
                countryCode: number.isoCode ?? "YE",
              );
      },
      onInputValidated: (bool isValid) {},
      textFieldController: widget.controller,
      focusNode: _focusNode,
     initialValue: PhoneNumber(isoCode: AppConstants.countryCode),
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: false,
      ),
      autoValidateMode: AutovalidateMode.onUserInteraction,
      ignoreBlank: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.pleaseEnterYourPhoneNumber;
        }
        return null;
      },
      autofillHints: const [AutofillHints.telephoneNumber],

      // ---- Selector Config ----
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET, 
        useEmoji: true, 
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 8,
      ),
    
      // ---- Decoration ----
      inputDecoration: InputDecoration(
        hintText: 'xxx xxx xxx',
        filled: true, 
      ),

      spaceBetweenSelectorAndTextField: 12,
    );
  }
}
