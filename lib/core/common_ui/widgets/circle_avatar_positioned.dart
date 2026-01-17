import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';

class CircleAvatarPositioned extends StatelessWidget {
  const CircleAvatarPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSize.positionedTop140,
      right: AppSize.positionedRight95,
      child: CircleAvatar(
        radius: AppSize.radius170,
        backgroundColor: context.isDark()
            ? AppColors.darkGray
            : AppColors.lightGray,
      ),
    );
  }
}
