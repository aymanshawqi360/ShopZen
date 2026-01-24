import 'package:dartz/dartz.dart';
import 'package:shopzen/core/config/network_config.dart';
import 'package:shopzen/core/error/api_error_hundler.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/mappers/auth_mappers.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_response_model.dart';
import 'package:shopzen/feature/auth/domain/entity/register_response_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthApiService apiService;

  AuthRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register({
    required RegisterRequestModel authRequestModel,
  }) async {
    try {
      RegisterResponseModel response = await apiService.register(
        body: authRequestModel.toJson(),
      );

      if (response.status == NetworkConfig.statusOk) {
        RegisterResponseEntity resulte;
        resulte = AuthMappers.authResponseModelToAuthResponseEntity(
          registerResponseModel: response,
        );
        return Right(resulte);
      } else {
        return Left(
          Failure(errorMessage: 'Register failed: status=${response.message}',
          errorCode:NetworkConfig.statusBadRequest,)          
        );
      }
    } catch (error) {
      return Left(ApiErrorHundler.errorHundel(error));
    }
  }
}
