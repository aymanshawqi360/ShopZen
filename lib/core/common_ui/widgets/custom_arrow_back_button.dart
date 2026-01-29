import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';

class CustomArrowBackButton extends StatelessWidget {
  final String location;
  final Widget? child;
 final IconData? icon;
final double? size;
  const CustomArrowBackButton({super.key, required this.location, this.child, this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(location);
      },
      child:child?? Icon(
       icon?? Icons.arrow_back_outlined,
        size:size??AppSize.iconBackButtonSize,
        color: context.isDark() ? AppColors.textWhite : AppColors.textDark,
      ),
    );
  }
}
