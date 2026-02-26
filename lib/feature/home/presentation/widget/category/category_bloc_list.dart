import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';
import 'package:shopzen/feature/home/presentation/widget/category/categories_list.dart';
import 'package:shopzen/feature/home/presentation/widget/category/category_loading_screen.dart';

class CategoryBlocList extends StatelessWidget {
  const CategoryBlocList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategorySuccess ||
          current is CategoryFailure ||
          current is CategoryLoading,
      builder: (context, state) {
        switch (state) {
          case CategorySuccess():
            return categorySuccessState(state: state);

          case CategoryFailure():
            return categoryFailureState();

          case CategoryLoading():
            return categoryLoadingState();

          default:
            return categoryLoadingState();
        }
      },
    );
  }

  CategoriesList categorySuccessState({required CategorySuccess state}) {
    return CategoriesList(categoryList: state.categories);
  }

  Widget categoryFailureState() {
    return Text("Error", style: AppTextStyles.bodyLarge);
  }

  Widget categoryLoadingState() {
    return CategoryLoadingScreen();
  }
}
