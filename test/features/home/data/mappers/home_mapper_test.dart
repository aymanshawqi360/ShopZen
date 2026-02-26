import 'package:flutter_test/flutter_test.dart';
import 'package:shopzen/feature/home/data/mappers/home_mapper.dart';
import 'package:shopzen/feature/home/data/model/category/category_response_model.dart';

void main() {
  late CategoryData categoryResponseModel;
  late CategoryData categoryResponseModelFailed;
  setUp(() {
    //Mode :

    // Category Failed
    categoryResponseModelFailed = CategoryData(
      name: 'defaultName',
      id: 0,
      image: 'defaultImage',
    );

    // Category Success
    categoryResponseModel = CategoryData(
      name: "Fashion",
      id: 0,
      image: 'testImage',
    );
  });

  group('test  CategoryResponseEntity', () {
    test(
      'should map CategoryResponseModel to CategoryResponseEntity success',
      () {
        final result =
            HomeMapper.mapCategoryResponseModelToCategoryResponseEntity(
              categoryResponseModel: categoryResponseModel,
            );
        expect(result.id, 0);
        expect(result.name, "Fashion");
        expect(result.image, 'testImage');
      },
    );

    test(
      'should map CategoryResponseModel to CategoryResponseEntity failed',
      () {
        final result =
            HomeMapper.mapCategoryResponseModelToCategoryResponseEntity(
              categoryResponseModel: categoryResponseModelFailed,
            );
        expect(result.id, 0);
        expect(result.name, "defaultName");
        expect(result.image, 'defaultImage');
      },
    );
  });
}
