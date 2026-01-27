import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/register_response_entity.dart';

abstract class AuthRepository {
  
  Future<Either<Failure,AuthResponseEntity>> register({required RegisterRequestModel authRequestModel});
  Future<Either<Failure,AuthResponseEntity>>login({required LoginRequestModel authRequestModel});
}