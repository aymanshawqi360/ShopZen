import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/feature/auth/presentation/cubit/password_update/password_update_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_button.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_form.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_screen_title.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/passwrod_update_bloc_listener.dart';

class PasswordUpdateBody extends StatelessWidget {
  const PasswordUpdateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PasswordUpdateCubit>(),
      child: Padding(
        padding: AppSpacing.paddingL20R20T60,
        child: Column(
          children: [
            const PasswordUpdateScreenTitle(),
            const PasswordUpdateForm(),
            const PasswrodUpdateBlocListener(),
            AppSize.gapH18,
            const PasswordUpdateButton(),
          ],
        ),
      ),
    );
  }
}
