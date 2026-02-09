import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/cubit/password_update/password_update_cubit.dart';

class PasswrodUpdateBlocListener extends StatelessWidget {
  const PasswrodUpdateBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordUpdateCubit, PasswordUpdateState>(
      listenWhen: (previous, current) =>
          current is PasswordUpdateFailure ||
          current is PasswordUpdateSuccess ||
          current is PasswordUpdateLoading,
      listener: (context, state) {
        if (state is PasswordUpdateSuccess) {
          _buildSuccessState(context: context);
          return;
        }
        if (state is PasswordUpdateFailure) {
          _buildFailureState(context: context, state: state);
          return;
        }
      },
      child: Container(),
    );
  }

  void _buildSuccessState({required BuildContext context}) {
    context.go(AppRoutes.login);
  }

  void _buildFailureState({
    required BuildContext context,
    required PasswordUpdateFailure state,
  }) {
    AppDialog.showApiError(context, state.errorMessage);
  }
}
