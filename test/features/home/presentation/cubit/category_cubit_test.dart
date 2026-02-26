import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/repo/home_repo.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';

class MockHomeRepo extends Mock implements HomeRepo {}

void main() {
  late MockHomeRepo mockHomeRepo;
  late CategoryCubit categoryCubit;
  setUp(() {
    mockHomeRepo = MockHomeRepo();
    categoryCubit = CategoryCubit(homeRepo: mockHomeRepo);
  });

  blocTest(
    "emits [CategoryLoading(), CategorySuccess()] when getCategories is called",
    build: () {
      when(
        () => mockHomeRepo.getCategories(),
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
        () => mockHomeRepo.getCategories(),
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
