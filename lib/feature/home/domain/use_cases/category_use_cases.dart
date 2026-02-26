import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/domain/repo/home_repo.dart';

class CategoryUseCases {
  final HomeRepo homeRepo;
  CategoryUseCases({required this.homeRepo});
  Future<Either<Failure, List<CategoryResponseEntity>>> getCategories() =>
      homeRepo.getCategories();
}
