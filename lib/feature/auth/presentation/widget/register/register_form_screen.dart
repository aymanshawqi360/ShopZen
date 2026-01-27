import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/common_ui/widgets/intl_phone_number_input.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/common_ui/widgets/custom_hidden_text_field.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:shopzen/core/Shared/widget/auth/auth_loading_button.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    debugPrint("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ColorFilter.mode(
      context.isDark() ? AppColors.griy400 : AppColors.darkBackground,
      BlendMode.srcIn,
    );

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==== first name ===
          AppSize.gapH30,
          Text(context.l10n.firstName),
          AppSize.gapH8,
          CustomTextField(
            key: Key("first_name"),
            controller: firstNameController,
            hintText: context.l10n.enterYourFirstName,
            prefixIcon: Transform.scale(
              scale: AppSize.loginEmailSvg,

              child: CustomSvg(
                svgAsset: AppAssets.account,
                colorFilter: isDark,
              ),
            ),

            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourFirstName;
              }
            },
          ),
          // ==== last name ===
          AppSize.gapH8,
          Text(context.l10n.lastName),
          AppSize.gapH8,
          CustomTextField(
            key: Key("last_name"),
            controller: lastNameController,
            hintText: context.l10n.enterYourLastName,
            prefixIcon: Transform.scale(
              scale: AppSize.loginEmailSvg,

              child: CustomSvg(
                svgAsset: AppAssets.account,
                colorFilter: isDark,
              ),
            ),

            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourLastName;
              }
            },
          ),
          // ==== Email ====
          AppSize.gapH8,
          Text(context.l10n.emailField),
          AppSize.gapH8,
          CustomTextField(
            key: Key("email"),
            controller: emailController,
            hintText: context.l10n.enterYourEmail,
            prefixIcon: Transform.scale(
              scale: AppSize.loginEmailSvg,

              child: CustomSvg(svgAsset: AppAssets.email, colorFilter: isDark),
            ),

            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return context.l10n.pleaseEnterYourEmail;
              }
            },
          ),
          // ==== Password ====
          AppSize.gapH8,
          Text(context.l10n.passwordField),
          AppSize.gapH8,
          CustomHiddenTextField(
            key: Key("password"),
            hintText: context.l10n.enterYourPassword,
            isDark: isDark,
            validatorName: context.l10n.pleaseEnterYourPassword,
            controller: passwordController,
          ),

          // ==== Confirm Password ====
          AppSize.gapH8,
          Text(context.l10n.confirmPassword),
          AppSize.gapH8,
          CustomHiddenTextField(
            key: Key("confirm_password"),
            hintText: context.l10n.enterYourConfirmPassword,
            isDark: isDark,
            validatorName: context.l10n.enterYourConfirmPassword,
            controller: confirmPasswordController,
          ),
          // ==== Phone ===
          AppSize.gapH8,
          Text(context.l10n.phoneField),
          AppSize.gapH8,
          CustomPhoneNumberField(
            key: Key("phone"),
            controller: phoneController,
          ),

          // ==== Button ===
          _checkUserValueButton(),
        ],
      ),
    );
  }

  AuthLoadingButton _checkUserValueButton() {
    return AuthLoadingButton<RegisterCubit, RegisterState>(
      isLoading: (state) => state is RegisterLoading,
      key: Key("register_button"),
      checkUserValue: () {
        context.read<RegisterCubit>().register(
          body: RegisterRequestModel(
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            phone: phoneController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            confirmPassword: confirmPasswordController.text.trim(),
            countryCode: context.read<RegisterCubit>().countryCode,
          ),
        );
      },
    );
  }
}
