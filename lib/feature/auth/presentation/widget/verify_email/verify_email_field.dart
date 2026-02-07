import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/Shared/widget/auth/auth_loading_button.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';

class VerifyEmailField extends StatefulWidget {
  const VerifyEmailField({super.key});

  @override
  State<VerifyEmailField> createState() => _VerifyEmailFieldState();
}

class _VerifyEmailFieldState extends State<VerifyEmailField> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
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
          Text(
            context.l10n.emailField,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp13,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.griy1000,
            ),
          ),
          AppSize.gapH4,
          CustomTextField(
            controller: _emailController,
            validator: (String? value) {
              log(_emailController.text);
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
          _forgotPasswordButton(),
        ],
      ),
    );
  }

  AuthLoadingButton _forgotPasswordButton() {
    return AuthLoadingButton<VerifyEmailCubit, VerifyEmailState>(
      isLoading: (state) => state is VerifyEmailLoading,
      key: Key("register_button"),
      checkUserValue: () {
        if (_formKey.currentState!.validate()) {
          context.read<VerifyEmailCubit>().forgotPassword(
            body: ForgotPasswordRequestModel(email: _emailController.text),
          );
        }
      },
    );
  }
}
