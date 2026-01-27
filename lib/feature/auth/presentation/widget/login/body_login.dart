import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/check_no_account.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/email_and_password.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/login_bloc_lisener.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/login_title.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH40,
        const LoginTitle(),
        const EmailAndPassword(),
        const Spacer(),
        const CheckNoAccount(),
        const LoginBlocLisener(),
      ],
    );
  }
}