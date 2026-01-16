import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/utils/app_color.dart';

abstract class ThemeBorders {
  OutlineInputBorder themeBorder();
}

class ThemeDefaultBorder {
  static OutlineInputBorder outlineInputBorder(ThemeBorders themeBorders) {
    return themeBorders.themeBorder();
  }
}

class ThemeErrorBorder extends ThemeBorders {
  @override
  OutlineInputBorder themeBorder() {
    return OutlineInputBorder(
      borderRadius: AppSpacing.borderRadius8,
      borderSide: BorderSide(
        color: AppColors.alertError500,
        width: AppSize.width1,
      ),
    );
  }
}

class ThemeFocusedBorder extends ThemeBorders {
  @override
  OutlineInputBorder themeBorder() {
    return OutlineInputBorder(
      borderRadius: AppSpacing.borderRadius8,
      borderSide: BorderSide(color: AppColors.blue400, width: AppSize.width1),
    );
  }
}

class ThemeEnabledBorder extends ThemeBorders {
  @override
  OutlineInputBorder themeBorder() {
    return OutlineInputBorder(
      borderRadius: AppSpacing.borderRadius8,
      borderSide: BorderSide(color: AppColors.griy500, width: AppSize.width1),
    );
  }
}
