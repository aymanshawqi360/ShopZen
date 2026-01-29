import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/Shared/widget/auth/auth_loading_button.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';

class ForgotPasswordButton extends StatelessWidget {
  final String email;
  final GlobalKey<FormState>  formKey ;
  const ForgotPasswordButton({super.key, required this.email, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return AuthLoadingButton<ForgotPasswordCubit, ForgotPasswordState>(
      isLoading: (state) => state is ForgotPasswordLoading,
      key: Key("register_button"),
      checkUserValue: () {
        if(formKey.currentState!.validate()){
          context.read<ForgotPasswordCubit>().forgotPassword(
          body: ForgotPasswordRequestModel(
            email: email
          )
        );
        }
      },
    );
  }
}