import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/password_update_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';

abstract class AuthRepository {
  
  Future<Either<Failure,AuthResponseEntity>> register({required RegisterRequestModel authRequestModel});
  Future<Either<Failure,AuthResponseEntity>>login({required LoginRequestModel authRequestModel});
  Future<Either<Failure,ForgotPasswordEntity>> forgotPassword({required ForgotPasswordRequestModel authRequestModel});
  Future<Either<Failure, ForgotPasswordEntity>> resendOtp({required ResendOtpRequestModel resendOtpRequestModel});
  Future<Either<Failure, ForgotPasswordEntity>> resetPassword({required ResetPasswordRequestMode resetPasswordRequestMode });
  Future<Either<Failure, ForgotPasswordEntity>> passwrodUpdate({required PasswordUpdateRequestModel passwordUpdateRequestModel });
}
