import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/register_response_entity.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';

abstract class AuthRepository {
  
  Future<Either<Failure,AuthResponseEntity>> register({required RegisterRequestModel authRequestModel});
  Future<Either<Failure,AuthResponseEntity>>login({required LoginRequestModel authRequestModel});
  Future<Either<Failure,ForgotPasswordEntity>> forgotPassword({required ForgotPasswordRequestModel authRequestModel});
}