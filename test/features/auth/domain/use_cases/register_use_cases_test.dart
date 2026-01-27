import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/register_response_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/register_use_cases.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late RegisterUseCases registerUseCases;
  late MockAuthRepository mockRegisterUseCases;
  late RegisterRequestModel authRequestSuccessModel;
  late RegisterRequestModel authRequestFailedModel;
  setUp(() {
    mockRegisterUseCases = MockAuthRepository();
    registerUseCases = RegisterUseCases(authRepository: mockRegisterUseCases);

    authRequestSuccessModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      phone: "512345675",
      countryCode: "SA",
    );

    authRequestFailedModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      phone: "5123456755866",
      countryCode: "SA",
    );
  });
  group("register use case test", () {
    test("should return RegisterUseCase when register is successful", () async {
      when(
        () => mockRegisterUseCases.register(
          authRequestModel: authRequestSuccessModel,
        ),
      ).thenAnswer(
        (_) async => Right(
          AuthResponseEntity(
            userData: "dsajakjdsadjsalkdjsakdjsadjsljsLKDJSKDjsKDJSDs",
            status: 200,
            message: 'success',
          ),
        ),
      );

      final result = await registerUseCases.register(
        authRequestModel: authRequestSuccessModel,
      );
      expect(result.isRight(), true);
      result.fold((_) => null, (data) {
        expect(data.status, 200);
        expect(data.message, 'success');
      });
    });
    test("should return RegisterUseCase when register is failure", () async {
      when(
        () => mockRegisterUseCases.register(
          authRequestModel: authRequestFailedModel,
        ),
      ).thenAnswer(
        (_) async => Left(
          Failure(
            errorData: {
              "message": [
                "The phone number does not match the selected country",
              ],
            },
          ),
        ),
      );
      final result = await registerUseCases.register(
        authRequestModel: authRequestFailedModel,
      );
      expect(result.isLeft(), true);
      result.fold((ifLeft) {
        expect(ifLeft.errorData, {
          "message": ["The phone number does not match the selected country"],
        });
      }, (_) => null);
    });
  });
}
