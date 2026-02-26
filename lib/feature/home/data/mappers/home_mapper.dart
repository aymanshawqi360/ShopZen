import 'package:shopzen/feature/home/data/model/category/category_response_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';

class HomeMapper {
  static CategoryResponseEntity
  mapCategoryResponseModelToCategoryResponseEntity({
    required CategoryData categoryResponseModel,
  }) {
    return CategoryResponseEntity(
      id: categoryResponseModel.id ?? 0,
      name: categoryResponseModel.name ?? "defaultName",
      image: categoryResponseModel.image ?? "defaultImage",
    );
  }
}
