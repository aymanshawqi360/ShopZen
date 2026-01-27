import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_button.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class AuthLoadingButton<C extends Cubit<S>, S> extends StatelessWidget {
  final void Function()? checkUserValue;

  final bool Function(S state) isLoading;

  const AuthLoadingButton({
    super.key,
    required this.checkUserValue,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.gapH30,
        BlocSelector<C, S, bool>(
          selector: (state) => isLoading(state),
          builder: (context, state) {
            return CustomButton(
              onPressed: checkUserValue,
              // key: Key("register_button"),
              child: state
                  ? Transform.scale(
                      scale: AppSize.progressIndicatorInLoadingState,
                      child: CircularProgressIndicator(
                        strokeWidth: AppSize.progressIndicatorStrokeWidth,
                        backgroundColor: context.islight()
                            ? AppColors.lightBackground
                            : AppColors.darkBackground,
                      ),
                    )
                  : Text(
                      context.l10n.register,
                      style: context.appTheme.textTheme.bodyLarge?.copyWith(
                        color: context.islight()
                            ? AppColors.textWhite
                            : AppColors.textDark,
                        fontWeight: FontWeightHelper.bold,
                        fontSize: AppSize.textSizeSp13,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
