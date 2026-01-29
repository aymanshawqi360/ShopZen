import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/feature/auth/presentation/widget/forgot_password/forgot_password_button.dart';

class ForgotPasswordField extends StatefulWidget {
  const ForgotPasswordField({super.key});

  @override
  State<ForgotPasswordField> createState() => _ForgotPasswordFieldState();
}

class _ForgotPasswordFieldState extends State<ForgotPasswordField> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey ;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }
  @override
  void dispose() {    
    super.dispose();
    _emailController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.emailField,style:  AppTextStyles.bodyMedium.copyWith(
                fontSize: AppSize.textSizeSp13,
                color: context.isDark()
                    ? AppColors.textWhite
                    : AppColors.griy1000,
              ),),
          AppSize.gapH8,
          CustomTextField(
            controller: _emailController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourEmail;
              }
              return null;
            },
            hintText: context.l10n.enterYourEmail,
            prefixIcon: Padding(
              padding: AppSpacing.paddingT5,
              child: Transform.scale(
                scale: AppSize.loginEmailSvg,
                alignment: Alignment.center,
                child: CustomSvg(
                  svgAsset: AppAssets.email,
                  colorFilter: ColorFilter.mode(
                    context.isDark()
                        ? AppColors.griy400
                        : AppColors.darkBackground,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          
          ForgotPasswordButton(email: _emailController.text.trim(),formKey: _formKey,),
        ],
      ),
    );
  }
  
}
