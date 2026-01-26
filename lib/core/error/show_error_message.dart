import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class AppDialog {
  AppDialog._();
  static void showApiError(BuildContext context, Failure error) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadius16,
          ),
          elevation: AppSize.elevation8,
          child: Container(
            padding: AppSpacing.paddingT5L8R8B19,
            decoration: BoxDecoration(
              borderRadius: AppSpacing.borderRadius16,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.griy50, AppColors.griy50],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Error Icon with Animation
                Center(
                  child: Column(
                    
                    children: [
                      Lottie.asset(
                        AppAssets.lottieError,
                        height: AppSize.lottieErrorHeight150,
                        fit: BoxFit.cover,
                      ),
                     // AppSize.gapH20,
                      Text(
                        context.l10n.somethingWentWrong,
                        style: TextStyle(
                          fontSize: AppSize.textSizeSp15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),

                // Title
                AppSize.gapH20,
                Text(
                  error.allError(),
                  style: context.appTheme.textTheme.titleMedium!.copyWith(
                    fontSize: AppSize.textSizeSp10,
                    fontWeight: FontWeightHelper.bold,
                    color: AppColors.griy1000,
                  ),
                ),

                // Action Buttons
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            overlayColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 120,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppSpacing.borderRadius8,
                            ),
                            side: BorderSide(color: AppColors.griy400),
                          ),
                          child: Text(
                            context.l10n.dismiss,
                            style: context.appTheme.textTheme.titleMedium!
                                .copyWith(
                                  fontSize: AppSize.textSizeSp12,
                                  fontWeight: FontWeightHelper.bold,
                                  color: AppColors.griy1000,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
