import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_password_update.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_user_Iinputs.dart';

class PasswordUpdateForm extends StatefulWidget {
  const PasswordUpdateForm({super.key});

  @override
  State<PasswordUpdateForm> createState() => _PasswordUpdateFormState();
}

class _PasswordUpdateFormState extends State<PasswordUpdateForm> {
  @override
  void initState() {
    super.initState();
    ValidateUserIinputs.initController(controller: ValidatePasswordUpdate());
  }

  @override
  void dispose() {
    super.dispose();
    ValidateUserIinputs.disposeController(
      disposeController: ValidatePasswordUpdate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ValidatePasswordUpdate.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSize.gapH48,
          formTitel(context: context, title: context.l10n.newPassword),
          AppSize.gapH4,
          CustomTextField(
            controller: ValidatePasswordUpdate.newPasswordController,
            hintText: context.l10n.enterYourNewPassword,
            validator: (vlaue) {
              if (vlaue == null || vlaue.isEmpty) {
                return context.l10n.pleaseEnterYourNewPassword;
              } else {
                return null;
              }
            },
          ),
          AppSize.gapH16,
          formTitel(context: context, title: context.l10n.confirmPassword),
          AppSize.gapH4,
          CustomTextField(
            controller: ValidatePasswordUpdate.confirmPasswordController,
            hintText: context.l10n.enterYourConfirmPassword,
            validator: (vlaue) {
              if (vlaue == null || vlaue.isEmpty) {
                return context.l10n.pleaseEnterYourConfirmPassword;
              } else {
                return null;
              }
            },
          ),
        
         
        ],
      ),
    );
  }

  Row formTitel({required BuildContext context, required String title}) {
    return Row(
      children: [
        Text(
          title,
          style: context.appTheme.textTheme.bodyMedium?.copyWith(
            fontSize: AppSize.textSizeSp12,
            color: context.isDark() ? AppColors.textWhite : AppColors.griy1000,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
