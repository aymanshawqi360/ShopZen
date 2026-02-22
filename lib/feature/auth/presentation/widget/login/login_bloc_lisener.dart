import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/cubit/login/login_cubit.dart';

class LoginBlocLisener extends StatelessWidget {
  const LoginBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginFailure ||
          current is LoginSuccess ||
          current is LoginLoading,
      listener: (context, state) {
        if (state is LoginSuccess) {
          _buildSuccessState(context: context);
        }
        if (state is LoginFailure) {
          _buildFailureState(context: context, state: state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _buildFailureState({
    required BuildContext context,
    required LoginFailure state,
  }) {
    return AppDialog.showApiError(context, state.messageError);
  }

  void _buildSuccessState({required BuildContext context}) {
    context.go(AppRoutes.home);
  }
}
