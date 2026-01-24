import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/register_response_entity.dart';

abstract class AuthRepository {
  
  Future<Either<Failure,RegisterResponseEntity>> register({required RegisterRequestModel authRequestModel});
}