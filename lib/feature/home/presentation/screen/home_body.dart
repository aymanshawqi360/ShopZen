import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/feature/home/presentation/widget/category/categoriesTitle.dart';
import 'package:shopzen/feature/home/presentation/widget/category/categories_list.dart';
import 'package:shopzen/feature/home/presentation/widget/search/searchField.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              AppSize.gapH12,
              const SearchField(),
              AppSize.gapH16,
              const Categoriestitle(),
              AppSize.gapH16,
              const CategoriesList(),
            ],
          ),
        ),
      ],
    );
  }
}
