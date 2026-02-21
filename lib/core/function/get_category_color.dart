import 'package:flutter/material.dart';
import 'package:shopzen/core/extension/app_extension.dart';

class GetCategoryColor {
  GetCategoryColor._();
  static Color getCategoryColor({
    required int index,
    required BuildContext context,
    required int selectedIndex,
    required List<Color> selectedColor,
    required List<Color> unselectedColor,
  }) {
    bool isSelected = (index == selectedIndex);
    bool isDark = context.isDark();

    if (isDark) {
      return isSelected ? selectedColor[0] : selectedColor[1];
    } else {
      return isSelected ? unselectedColor[0] : unselectedColor[1];
    }
  }
}
