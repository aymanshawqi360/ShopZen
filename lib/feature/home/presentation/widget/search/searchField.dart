import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/common_ui/widgets/custom_text_field.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/constants/app_strings.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = context.isDark() ? AppColors.dark : AppColors.griy50;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Material(
        color: color,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.3),
        borderRadius: AppSpacing.borderRadius10,
        child: CustomTextField(
          hintText: 'Find your favorite items',
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppStrings.satoshiFont,
            color: AppColors.griy700,
            fontWeight: FontWeightHelper.regular,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppSpacing.borderRadius10,
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppSpacing.borderRadius10,
            borderSide: BorderSide(color: color),
          ),

          prefixIcon: Transform.scale(
            alignment: Alignment.center,
            scale: 0.6,
            child: CustomSvg(svgAsset: AppAssets.search),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
        ),
      ),
    );
  }
}
