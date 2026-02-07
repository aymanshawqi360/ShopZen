import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_form.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_screen_title.dart';

class PasswordUpdateBody extends StatelessWidget {
  const PasswordUpdateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  AppSpacing.paddingL20R20T60,
      child: Column(
        children: [
          const PasswordUpdateScreenTitle(),
         const PasswordUpdateForm(),
        ],
      ),
    );
  }
}