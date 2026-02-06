import 'package:dartz/dartz.dart';
import 'package:shopzen/core/config/network_config.dart';
import 'package:shopzen/core/error/api_error_hundler.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/mappers/auth_mappers.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/forgot_password_response_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthApiService apiService;

  AuthRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, AuthResponseEntity>> register({
    required RegisterRequestModel authRequestModel,
  }) async {
    try {
      AuthResponseModel response = await apiService.register(
        body: authRequestModel,
      );

      if (response.status == NetworkConfig.statusOk) {
        AuthResponseEntity resulte;
        resulte = AuthMappers.authResponseModelToAuthResponseEntity(
          registerResponseModel: response,
        );
        return Right(resulte);
      } else {
        return Left(
          Failure(
            errorMessage: 'Register failed: status=${response.message}',
            errorCode: NetworkConfig.statusBadRequest,
          ),
        );
      }
    } catch (error) {
      return Left(ApiErrorHundler.errorHundel(error));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login({
    required LoginRequestModel authRequestModel,
  }) async {
    try {
      AuthResponseModel response = await apiService.login(
        body: authRequestModel,
      );

      if (response.status == NetworkConfig.statusOk) {
        AuthResponseEntity resulte;
        resulte = AuthMappers.authResponseModelToAuthResponseEntity(
          registerResponseModel: response,
        );
        return Right(resulte);
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

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword({
    required ForgotPasswordRequestModel authRequestModel,
  }) async {
    try {
      ForgotPasswordResponseModel resulte = await apiService.forgotPassword(
        body: authRequestModel,
      );

      if (resulte.status == NetworkConfig.statusOk) {
        ForgotPasswordEntity result =
            AuthMappers.forgotPasswordResponseModelToOtpResponseEntity(
              forgotPasswordResponseModel: resulte,
            );
        return Right(result);
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

  @override
  Future<Either<Failure, ForgotPasswordEntity>> resendOtp({required ResendOtpRequestModel resendOtpRequestModel}) async{
   try {
     ForgotPasswordResponseModel result = await apiService.otpVerification(body: resendOtpRequestModel);

     if(result.status == NetworkConfig.statusOk){
       ForgotPasswordEntity forgotPasswordEntity = AuthMappers.forgotPasswordResponseModelToOtpResponseEntity(forgotPasswordResponseModel: result);
       return Right(forgotPasswordEntity);
     }else {
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

  @override
  Future<Either<Failure, ForgotPasswordEntity>> resetPassword({required ResetPasswordRequestMode resetPasswordRequestMode}) async{
    try {
      ForgotPasswordResponseModel result=await apiService.resetPassword(body: resetPasswordRequestMode);
  
      if(result.status == NetworkConfig.statusOk){
        ForgotPasswordEntity forgotPasswordEntity = AuthMappers.resetPasswordResponseModelToOtpResponseEntity(forgotPasswordResponseModel: result);
        return Right(forgotPasswordEntity);
      }else {
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
