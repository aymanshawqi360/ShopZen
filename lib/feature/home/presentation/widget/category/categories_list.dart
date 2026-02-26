import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_list_view.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';
import 'package:shopzen/feature/home/presentation/widget/category/category_item.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryResponseEntity> categoryList;
  const CategoriesList({super.key, required this.categoryList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.categoryHeight73,
      child: Column(
        children: [
          Expanded(
            child: CustomListView(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItem(
                onTap: () {
                  context.read<CategoryCubit>().selectCategory(category: index);
                },
                categoryDate: categoryList[index],
              ),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
