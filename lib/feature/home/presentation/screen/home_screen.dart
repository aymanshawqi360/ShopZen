import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/common_ui/widgets/custom_appbar.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';
import 'package:shopzen/feature/home/presentation/screen/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: BlocProvider(
        create: (context) => sl<CategoryCubit>()..getCategories(),
        child: const HomeScreenContent(),
      ),
    );
  }
}
