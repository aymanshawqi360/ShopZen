import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopzen/core/common_ui/widgets/custom_arrow_back_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/widget/verify_email/verify_email_field.dart';
import 'package:shopzen/feature/auth/presentation/widget/verify_email/verify_email_bloc_lisener.dart';
import 'package:shopzen/feature/auth/presentation/widget/verify_email/verify_email_title_and_description.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingL20R20T10,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CustomArrowBackButton(location: AppRoutes.login),
            const VerifyEmailTitleAndDescription(),
            AppSize.gapH48,
            const VerifyEmailField(),
            const VerifyEmailBlocLisener(),
          ],  
        ),
      ),
    );
  }
}
