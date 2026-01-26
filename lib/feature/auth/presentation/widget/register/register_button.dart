import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  final void Function() checkUserValue;
  const RegisterButton({super.key, required this.checkUserValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH30,
        BlocSelector<RegisterCubit, RegisterState, bool>(
          selector: (state) {
            return state is RegisterLoading;
          },
          builder: (context, state) {
            return CustomButton(
              // key: Key("register_button"),
              child: state ? Transform.scale(
                scale:AppSize.progressIndicatorInLoadingState,
                child: CircularProgressIndicator(
                  strokeWidth: AppSize.progressIndicatorStrokeWidth,
                  backgroundColor: AppColors.lightBackground,
                ),
              ) : Text(
                
                context.l10n.register,
                style: context.appTheme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeightHelper.bold,
                  fontSize: AppSize.textSizeSp13,
                ),
              ),

              onPressed: () {
                checkUserValue();
              },
            );
          },
        ),
      ],
    );
  }
}
