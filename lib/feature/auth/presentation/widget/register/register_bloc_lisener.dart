import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/error/show_error_message.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

class RegisterBlocLisener extends StatelessWidget {
  const RegisterBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterFailure ||
          current is RegisterSuccess,
      listener: (context, state) {
        switch (state) {
          case RegisterSuccess():
            return _buildSuccessState(context: context);
          case RegisterFailure():
            return _buildFailureState(context: context, state: state);

          default: Text("data",style: AppTextStyles.bodyLarge,);
        }
        
         
      },
      builder: (context, state) {
        return SizedBox.shrink();
      },
    );
  }

   void _buildSuccessState({required BuildContext context}) {
    context.go(AppRoutes.login);
  }

  void _buildFailureState({
    required BuildContext context,
    required RegisterFailure state,
  }) {
   AppDialog.showApiError(context,state.errorMessage);
  }
}
