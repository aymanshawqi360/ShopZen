import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/feature/auth/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';

class VerifyEmailBlocLisener extends StatelessWidget {
  const VerifyEmailBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      buildWhen: (previous, current) =>
          current is VerifyEmailSuccess ||
          current is VerifyEmailFailure ||
          current is VerifyEmailLoading,
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          _buildSuccessState(context: context);
          return;
        }
        if (state is VerifyEmailFailure) {
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
    context.go(AppRoutes.otpScreen);
  }

  void _buildFailureState({
    required BuildContext context,
    required VerifyEmailFailure state,
  }) {
    AppDialog.showApiError(context, state.errorMessage);
  }
}
