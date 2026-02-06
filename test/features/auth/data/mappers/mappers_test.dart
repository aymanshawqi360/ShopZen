import 'package:flutter_test/flutter_test.dart';
import 'package:shopzen/feature/auth/data/mappers/auth_mappers.dart';
import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/core/Shared/model/auth/forgot_password_response_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';

void main() {
  late AuthResponseModel registerResponseModel;
  late ForgotPasswordResponseModel forgotPasswordResponseModel;

  setUp(() {
    forgotPasswordResponseModel = ForgotPasswordResponseModel(
      message: "success",
      status: 200,
    );
    registerResponseModel = AuthResponseModel(
      status: 200,
      message: 'success',
      userData: UserData(token: 'testToken'),
    );
  });

  test("should map RegisterResponseModel to RegisterResponseEntity", () {
    final result = AuthMappers.authResponseModelToAuthResponseEntity(
      registerResponseModel: registerResponseModel,
    );

    expect(
      result,
      const AuthResponseEntity(
        status: 200,
        message: 'success',
        userData: 'testToken',
      ),
    );
  });

  test("should map ForgotPasswordResponseModel to OtpResponseEntity", () {
    ForgotPasswordEntity result =
        AuthMappers.forgotPasswordResponseModelToOtpResponseEntity(
          forgotPasswordResponseModel: forgotPasswordResponseModel,
        );
    expect(result, const ForgotPasswordEntity(status: 200, message: "success"));
  });
  test('should map ResetPasswordResponseModel to OtpResponseEntity', () {
    ForgotPasswordEntity result =
        AuthMappers.resetPasswordResponseModelToOtpResponseEntity(
          forgotPasswordResponseModel: forgotPasswordResponseModel,
        );
    expect(result, const ForgotPasswordEntity(status: 200, message: "success"));
  });
}
