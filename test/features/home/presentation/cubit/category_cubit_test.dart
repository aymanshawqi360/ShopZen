import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/use_cases/category_use_cases.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';

class MockCategoryUseCases extends Mock implements CategoryUseCases {}

void main() {
  late MockCategoryUseCases mockCategoryUseCases;
  late CategoryCubit categoryCubit;
  setUp(() {
    mockCategoryUseCases = MockCategoryUseCases();
    categoryCubit = CategoryCubit(categoryUseCases: mockCategoryUseCases);
  });

  blocTest(
    "emits [CategoryLoading(), CategorySuccess()] when getCategories is called",
    build: () {
      when(
        () => mockCategoryUseCases.getCategories(),
      ).thenAnswer((_) async => Right([]));

      return categoryCubit;
    },
    act: (bloc) async {
      await bloc.getCategories();
    },
    expect: () => [CategoryLoading(), CategorySuccess(categories: [])],
  );

  blocTest(
    "emits [CategoryLoading(), CategoryFailure()] when getCategories is called",
    build: () {
      when(
        () => mockCategoryUseCases.getCategories(),
      ).thenAnswer((_) async => Left(Failure(errorMessage: "error")));

      return categoryCubit;
    },
    act: (bloc) async {
      await bloc.getCategories();
    },
    expect: () => [
      CategoryLoading(),
      CategoryFailure(errorMessage: Failure(errorMessage: "error")),
    ],
  );
}
