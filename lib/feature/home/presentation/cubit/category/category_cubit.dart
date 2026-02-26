import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/domain/use_cases/category_use_cases.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryUseCases categoryUseCases;
  CategoryCubit({required this.categoryUseCases}) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    Either<Failure, List<CategoryResponseEntity>> response =
        await categoryUseCases.getCategories();
    response.fold(
      (ifLeft) {
        emit(
          CategoryFailure(
            errorMessage: Failure(
              errorData: ifLeft.errorData,
              errorMessage: ifLeft.errorMessage,
              errorCode: ifLeft.errorCode,
            ),
          ),
        );
      },
      (ifRight) {
        emit(CategorySuccess(categories: ifRight));
      },
    );
  }

  int _index = -1;
  int get selectedIndex => _index;
  void selectCategory({required int category}) {
    _index = category;
    emit(CategorySelected(index: category));
  }
}
