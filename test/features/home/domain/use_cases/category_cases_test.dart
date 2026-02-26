import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/domain/repo/home_repo.dart';
import 'package:shopzen/feature/home/domain/use_cases/category_use_cases.dart';

class MockHomeRepo extends Mock implements HomeRepo {}

void main() {
  late MockHomeRepo mockHomeRepo;
  late CategoryUseCases categoryUseCases;
  late List<CategoryResponseEntity> categories;
  setUp(() {
    mockHomeRepo = MockHomeRepo();
    categoryUseCases = CategoryUseCases(homeRepo: mockHomeRepo);

    categories = [
      CategoryResponseEntity(id: 0, name: 'nameOneTest', image: 'imageOneTest'),
      CategoryResponseEntity(id: 1, name: 'nameTwoTest', image: 'imageTwoTest'),
    ];
  });

  test('should return CategoryUseCase success', () async {
    when(
      () => mockHomeRepo.getCategories(),
    ).thenAnswer((_) async => Right(categories));

    final result = await categoryUseCases.getCategories();
    expect(result.isRight(), true);
    result.fold((_) => null, (ifRight) {
      expect(ifRight.length, 2);
      expect(ifRight[0].id, 0);
      expect(ifRight[0].name, 'nameOneTest');
      expect(ifRight[0].image, 'imageOneTest');
      expect(ifRight[1].id, 1);
      expect(ifRight[1].name, 'nameTwoTest');
      expect(ifRight[1].image, 'imageTwoTest');
    });
  });

  test('should return CategoryUseCase failure', () async {
    when(() => mockHomeRepo.getCategories()).thenAnswer(
      (_) async => Left(Failure(errorMessage: "error", errorCode: 400)),
    );
    final result = await categoryUseCases.getCategories();
    expect(result.isLeft(), true);
    result.fold(
      (failure) => {
        expect(failure.errorMessage, "error"),
        expect(failure.errorCode, 400),
      },
      (r) => {expect(r.length, 0), expect(r, null)},
    );
  });
}
