import 'package:shopzen/feature/auth/data/model/register/register_response_model.dart';
import 'package:shopzen/feature/auth/domain/entity/register_response_entity.dart';

class AuthMappers {
  static RegisterResponseEntity authResponseModelToAuthResponseEntity({
    required RegisterResponseModel registerResponseModel,
  }) {
    return RegisterResponseEntity(
      status: registerResponseModel.status ?? 200,
      message: registerResponseModel.message ?? "defaultMessage",
      userData: registerResponseModel.userData.token??"defaultToken",
    );
  }
}
