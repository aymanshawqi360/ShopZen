import 'package:flutter/widgets.dart';
import 'package:shopzen/core/Shared/widget/auth/auth_loading_button.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_password_update.dart';
import 'package:shopzen/feature/auth/domain/validation/validate_user_Iinputs.dart';
import 'package:shopzen/feature/auth/presentation/cubit/password_update/password_update_cubit.dart';

class PasswordUpdateButton extends StatelessWidget {
  const PasswordUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLoadingButton<PasswordUpdateCubit, PasswordUpdateState>(
      title: context.l10n.updatePassword,
      checkUserValue: () {
        ValidateUserIinputs.validateThenDoSignup(
          validateThenDoSignup: ValidatePasswordUpdate(),
          context: context,
        );
      },
      isLoading: (state) {
        return state is PasswordUpdateLoading;
      },
    );
  }
}
