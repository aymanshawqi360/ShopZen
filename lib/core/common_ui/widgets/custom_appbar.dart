import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool? centerTitle;
  final Widget? title;
  final EdgeInsetsGeometry? actionsPadding;
  final List<Widget>? actions;
  const CustomAppbar({
    super.key,
    this.centerTitle,
    this.title,
    this.actionsPadding,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appTheme.scaffoldBackgroundColor,
      titleSpacing: 20.w,
      centerTitle: centerTitle ?? false,

      title:
          title ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loaction',
                style: context.appTheme.textTheme.titleSmall?.copyWith(
                  color: AppColors.griy800,
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              Text(
                'Dhaka,Bangladesh',
                style: context.appTheme.textTheme.titleSmall?.copyWith(
                  color: AppColors.griy950,
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
      actionsPadding:
          actionsPadding ?? EdgeInsets.only(right: 20.w, left: 20.w),
      actions:
          actions ??
          [
            CustomSvg(
              svgAsset: AppAssets.notification,
              svgHeight: 24.h,
              svgWidth: 24.w,
              colorFilter: ColorFilter.mode(
                context.isDark() ? AppColors.griy400 : AppColors.darkBackground,
                BlendMode.srcIn,
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.h);
}
