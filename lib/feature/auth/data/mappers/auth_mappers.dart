import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';
import 'package:shopzen/core/Shared/auth/entity/register_response_entity.dart';

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
}
