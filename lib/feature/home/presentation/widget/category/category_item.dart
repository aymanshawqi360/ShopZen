import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/common_ui/widgets/custom_svg.dart';
import 'package:shopzen/core/constants/api_constants.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/function/get_category_color.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final CategoryResponseEntity categoryDate;
  const CategoryItem({super.key, required this.categoryDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingH8,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) => current is CategorySelected,
        builder: (context, state) {
          final cubit = context.read<CategoryCubit>();
          return GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _categoryImage(cubit, context),
                _categoryName(context, cubit),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _categoryImage(CategoryCubit cubit, BuildContext context) {
    return Container(
      width: AppSize.widthInContainer49,
      height: AppSize.heightInContainer48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: GetCategoryColor.getCategoryColor(
          index: cubit.selectedIndex,
          context: context,
          selectedIndex: categoryDate.id ?? 0,
          selectedColor: [AppColors.primaryColor, AppColors.dark],
          unselectedColor: [AppColors.primaryColor, AppColors.blue50],
        ),
      ),
      child: Transform.scale(
        scale: 0.5,
        child: CustomSvg(
          colorFilter: ColorFilter.mode(
            GetCategoryColor.getCategoryColor(
              index: cubit.selectedIndex,
              context: context,
              selectedIndex: categoryDate.id ?? 0,
              selectedColor: [AppColors.griy400, AppColors.primaryColor],
              unselectedColor: [AppColors.textLight, AppColors.textDark],
            ),
            BlendMode.srcIn,
          ),
          svgHeight: AppSize.categorySvgHeight,
          svgWidth: AppSize.categorySvgWidth,
          svgNetworkUrl: '${ApiBasUrl.imageUrl}${categoryDate.image}',
        ),
      ),
    );
  }

  Text _categoryName(BuildContext context, CategoryCubit cubit) {
    return Text(
      textAlign: TextAlign.center,
      categoryDate.name ?? "",
      style: context.appTheme.textTheme.bodySmall!.copyWith(
        fontSize: AppSize.textSizeSp10,
        fontWeight: FontWeightHelper.regular,
        color: GetCategoryColor.getCategoryColor(
          index: cubit.selectedIndex,
          context: context,
          selectedIndex: categoryDate.id ?? 0,
          selectedColor: [AppColors.primaryColor, AppColors.griy400],
          unselectedColor: [AppColors.primaryColor, AppColors.textDark],
        ),
      ),
    );
  }
}
