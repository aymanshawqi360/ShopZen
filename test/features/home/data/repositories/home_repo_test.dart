import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:shopzen/feature/home/data/model/category/category_response_model.dart';
import 'package:shopzen/feature/home/data/repo_implementation/home_repo_implementation.dart';

class MockHomeHomeApiService extends Mock implements HomeApiService {}

void main() {
  late HomeRepoImplementation homeRepoImplementation;
  late MockHomeHomeApiService mockHomeHomeApiService;
  late CategoryResponseModel categoryResponseModel;
  late CategoryResponseModel categoryResponseModelFailed;
  late CategoryData categoryData;

  setUp(() {
    mockHomeHomeApiService = MockHomeHomeApiService();
    homeRepoImplementation = HomeRepoImplementation(
      homeApiService: mockHomeHomeApiService,
    );
    categoryData = CategoryData(name: "Fashion", id: 0, image: "testImage");

    //Mode :
    // Category Success
    categoryResponseModel = CategoryResponseModel(
      status: 200,
      categoryData: [categoryData],
    );
    //Category Failed
    categoryResponseModelFailed = CategoryResponseModel(
      status: 400,
      categoryData: [],
    );
  });

  group('test [ CategoryResponseEntity ]', () {
    test('test [ CategoryResponseEntity ] when success', () async {
      when(
        () => mockHomeHomeApiService.getCategories(),
      ).thenAnswer((_) async => categoryResponseModel);

      final result = await homeRepoImplementation.getCategories();
      expect(result.isRight(), true);
      result.fold((failure) => null, (categoryResponse) {
        expect(categoryResponse.length, 1);
        expect(categoryResponse[0].name, categoryData.name);
      });
    });

    test('test [ CategoryResponseEntity ] when failure', () async {
      when(
        () => mockHomeHomeApiService.getCategories(),
      ).thenAnswer((_) async => categoryResponseModelFailed);

      final result = await homeRepoImplementation.getCategories();
      expect(result.isLeft(), true);
      result.fold(
        (failure) => {expect(failure.errorCode, 400)},
        (categoryResponse) => {
          expect(categoryResponse, null),
          expect(categoryResponse.length, 0),
        },
      );
    });
  });
}
