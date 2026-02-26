import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryResponseEntity>>> getCategories();
}
