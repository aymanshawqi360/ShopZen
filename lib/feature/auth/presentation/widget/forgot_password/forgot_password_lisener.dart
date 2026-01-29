import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';

class ForgotPasswordLisener extends StatelessWidget {
  const ForgotPasswordLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          current is ForgotPasswordSuccess ||
          current is ForgotPasswordFailure ||
          current is ForgotPasswordLoading,
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          _buildSuccessState(context: context);
          return;
        }
        if (state is ForgotPasswordFailure) {
          _buildFailureState(context: context, state: state);
          return;
        }
      },
      builder: (context, state) {
        return SizedBox.shrink();
      },
    );
  }

  void _buildSuccessState({required BuildContext context}) {
    // context.go(AppRoutes.login);
  }

  void _buildFailureState({
    required BuildContext context,
    required ForgotPasswordFailure state,
  }) {
    AppDialog.showApiError(context, state.errorMessage);
  }
}
