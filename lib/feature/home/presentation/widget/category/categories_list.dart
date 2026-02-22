import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/common_ui/widgets/custom_list_view.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/function/get_category_color.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int count = -1;
  List<String> categories = [
    "Fashion",
    "Fitness",
    "Living",
    "Games",
    "Stationery",
    "Beauty",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73.h,
      child: Column(
        children: [
          Expanded(
            child: CustomListView(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        count = index;
                        setState(() {});
                      },
                      child: Container(
                        width: 49.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: getCategoryColor(
                            index: index,
                            context: context,
                            selectedIndex: count,
                            selectedColor: [
                              AppColors.lightGray,
                              AppColors.dark,
                            ],
                            unselectedColor: [
                              AppColors.primaryColor,
                              AppColors.blue50,
                            ],
                          ),
                        ),
                      ),
                    ),

                    Text(
                      textAlign: TextAlign.center,
                      categories[index].toString(),
                      style: context.appTheme.textTheme.bodySmall!.copyWith(
                        fontSize: AppSize.textSizeSp10,
                        fontWeight: FontWeightHelper.regular,
                        color: getCategoryColor(
                          index: index,
                          context: context,
                          selectedIndex: count,
                          selectedColor: [
                            AppColors.primaryColor,
                            AppColors.griy400,
                          ],
                          unselectedColor: [
                            AppColors.primaryColor,
                            AppColors.textDark,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }

  Color getCategoryColor({
    required int index,
    required BuildContext context,
    required int selectedIndex,
    required List<Color> selectedColor,
    required List<Color> unselectedColor,
  }) {
    bool isSelected = (index == selectedIndex);
    bool isDark = context.isDark();

    if (isDark) {
      return isSelected ? AppColors.griy400 : AppColors.dark;
      //    return isSelected ? selectedColor[0] : selectedColor[1];
    } else {
      //return isSelected ? unselectedColor[0] : unselectedColor[1];
      return isSelected ? AppColors.textWhite : const Color(0xFFEBEFFF);
    }
  }
}
