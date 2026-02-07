import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:shopzen/core/Shared/widget/auth/auth_loading_button.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSize.gapH48,
          Text(
            context.l10n.emailField,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp13,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.griy1000,
            ),
          ),
          // ==== Email ===
          AppSize.gapH4,
          CustomTextField(
            controller: emailController,
            hintText: context.l10n.enterYourEmail,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourEmail;
              }
              return null;
            },
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
          AppSize.gapH18,
          Text(
            context.l10n.passwordField,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp13,
              color: context.isDark()
                  ? AppColors.textWhite
                  : AppColors.griy1000,
            ),
          ),
          // ==== Password ===
          AppSize.gapH4,
          CustomTextField(
            controller: passwordController,
            hintText: context.l10n.enterYourPassword,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourPassword;
              }
              return null;
            },
            prefixIcon: Padding(
              padding: AppSpacing.paddingT5,
              child: Transform.scale(
                scale: AppSize.loginEmailSvg,
                alignment: Alignment.center,
                child: CustomSvg(
                  svgAsset: AppAssets.password,
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
          AppSize.gapH4,
          // ==== Password Validation ===
          const PasswordValidation(),
          AppSize.gapH24,
          // ==== Button ===
          _checkUserValueButton(),
        ],
      ),
    );
  }
 AuthLoadingButton _checkUserValueButton(){
    return AuthLoadingButton<LoginCubit, LoginState>(
            isLoading: (state) => state is LoginLoading,  
            key: Key("register_button"),
            checkUserValue: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                  body: LoginRequestModel(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
              }
            },
          ); 
  }
}
