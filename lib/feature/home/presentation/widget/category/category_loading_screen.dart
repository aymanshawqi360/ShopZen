import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_shimmer_widget.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';

class CategoryLoadingScreen extends StatelessWidget {
  const CategoryLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.categoryHeight73,
      child: Column(
        children: [
          Expanded(
            child: CustomShimmerWidget(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AppConstants.itemCountLoading,
                itemBuilder: (context, index) => Padding(
                  padding: AppSpacing.paddingH7,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: AppSize.widthInContainer46,
                        height: AppSize.heightInContainer44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: AppSpacing.borderRadius8,
                        ),
                      ),
                      Padding(
                        padding: AppSpacing.paddingH8V5,
                        child: Container(
                          width: AppSize.widthInContainer35,
                          height: AppSize.heightInContainer9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppSpacing.borderRadius3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
