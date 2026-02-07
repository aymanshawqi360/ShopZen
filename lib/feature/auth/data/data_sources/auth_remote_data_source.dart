import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopzen/core/constants/api_constants.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/forgot_password_response_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(EndPonts.register)
  Future<AuthResponseModel> register({
      @Body() required RegisterRequestModel body});

  @POST(EndPonts.login)
  Future<AuthResponseModel> login({@Body() required LoginRequestModel body});    

  @POST( EndPonts.forgotPassword)
  Future<ForgotPasswordResponseModel> forgotPassword({@Body() required ForgotPasswordRequestModel body});

  @POST(EndPonts.otpVerification)
  Future<ForgotPasswordResponseModel> otpVerification({@Body() required ResendOtpRequestModel body});
  
  @POST(EndPonts.resetPassword)
  Future<ForgotPasswordResponseModel>resetPassword({@Body() required ResetPasswordRequestMode body});
}

