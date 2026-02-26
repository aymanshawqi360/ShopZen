import 'package:dartz/dartz.dart';
import 'package:shopzen/core/config/network_config.dart';
import 'package:shopzen/core/error/api_error_hundler.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:shopzen/feature/home/data/mappers/home_mapper.dart';
import 'package:shopzen/feature/home/data/model/category/category_response_model.dart';
import 'package:shopzen/feature/home/domain/entity/category/category_response_entity.dart';
import 'package:shopzen/feature/home/domain/repo/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeApiService homeApiService;

  const HomeRepoImplementation({required this.homeApiService});
  @override
  Future<Either<Failure, List<CategoryResponseEntity>>> getCategories() async {
    try {
      CategoryResponseModel result = await homeApiService.getCategories();
      if (result.status == NetworkConfig.statusOk) {
        List<CategoryResponseEntity> categoryResponseEntity = result
            .categoryData!
            .map(
              (r) =>
                  HomeMapper.mapCategoryResponseModelToCategoryResponseEntity(
                    categoryResponseModel: r,
                  ),
            )
            .toList();
        if (categoryResponseEntity.isEmpty) {
          throw Exception();
        }
        return Right(categoryResponseEntity);
      } else {
        return Left(
          Failure(
            errorMessage: FailureMessage.theOperationFailed,
            errorCode: NetworkConfig.statusBadRequest,
          ),
        );
      }
    } catch (error) {
      return Left(ApiErrorHundler.errorHundel(error));
    }
  }
}
