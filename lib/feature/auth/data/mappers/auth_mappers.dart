import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/core/Shared/model/auth/forgot_password_response_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';

class AuthMappers {
  static AuthResponseEntity authResponseModelToAuthResponseEntity({
    required AuthResponseModel registerResponseModel,
  }) {
    return AuthResponseEntity(
      status: registerResponseModel.status ?? 200,
      message: registerResponseModel.message ?? "defaultMessage",
      userData: registerResponseModel.userData.token??"defaultToken",
    );
  }

  static ForgotPasswordEntity forgotPasswordResponseModelToOtpResponseEntity({
    required ForgotPasswordResponseModel forgotPasswordResponseModel,
  }) {
    return ForgotPasswordEntity(
      status: forgotPasswordResponseModel.status ?? 200,
      message: forgotPasswordResponseModel.message ?? "defaultMessage",
    );
  }
  static ForgotPasswordEntity resetPasswordResponseModelToOtpResponseEntity({
    required ForgotPasswordResponseModel forgotPasswordResponseModel,
  }) {
    return ForgotPasswordEntity(
      status: forgotPasswordResponseModel.status ?? 200,
      message: forgotPasswordResponseModel.message ?? "defaultMessage",
    );
  }
}
