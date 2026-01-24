import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';

class PasswordValidation extends StatefulWidget {
  const PasswordValidation({super.key});

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: AppSize.checkboxWidth20,
              height: AppSize.checkboxHeight20,
              child: Checkbox(
                value: isRememberMe,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: context.isDark()
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
                  width: 1.5,
                ),
                activeColor: AppColors.blue500,
                checkColor: AppColors.lightBackground,
              ),
            ),
            AppSize.gapW8,
            Text(
              context.l10n.rememberMe,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.blue400,
                fontSize: AppSize.textSizeSp12,
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: () {
            context.go(AppRoutes.forgotPassword);
            
          },
          child: Text(
            context.l10n.forgotPassword,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: AppSize.textSizeSp12,
              color: context.isDark() ? AppColors.textWhite : AppColors.griy1000,
            ),
          ),
        ),
      ],
    );
  }
}
