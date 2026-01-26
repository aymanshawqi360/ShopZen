import 'package:flutter_test/flutter_test.dart';
import 'package:shopzen/feature/auth/data/mappers/auth_mappers.dart';
import 'package:shopzen/feature/auth/data/model/register/register_response_model.dart';
import 'package:shopzen/feature/auth/domain/entity/register_response_entity.dart';

void main() {
  late RegisterResponseModel registerResponseModel;

  setUp(() {
    registerResponseModel = RegisterResponseModel(
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
      const RegisterResponseEntity(
        status: 200,
        message: 'success',
        userData: 'testToken',
      ),
    );
  });
}
