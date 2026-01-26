import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_response_model.dart';
import 'package:shopzen/feature/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:shopzen/feature/auth/domain/entity/register_response_entity.dart';

class MockAuthApiService extends Mock implements AuthApiService {}

void main() {
  late MockAuthApiService mockAuthApiService;
  late AuthRepoImplementation authRepoImplementation;
  late RegisterRequestModel registerRequestModel;
  late RegisterResponseModel registerResponseModel;
  late RegisterRequestModel registerRequestModelFailed;
  late Failure failure;
  late UserData userData;
  setUp(() {
    mockAuthApiService = MockAuthApiService();
    authRepoImplementation = AuthRepoImplementation(
      apiService: mockAuthApiService,
    );
    registerRequestModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      phone: "512345675",
      countryCode: "SA",
    );

    userData = UserData(
      token: "dslkdsaldksalkwqewqpdlpqldpldsad5s4d56sdsa564dsa5d4sa56ds",
    );

    registerResponseModel = RegisterResponseModel(
      status: 200,
      message: "success",
      userData: userData,
    );

    registerRequestModelFailed = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      phone: "512345678",
      password: "test123456789",
      confirmPassword: "test123456789",
      countryCode: "SA",
    );

    failure = Failure(
      errorData: {
        "password": ["The password field format is invalid."],
      },
    );
  });

  group("Test register method in auth repo", () {
    test("should return session when login is successful", () async {
      when(
        () => mockAuthApiService.register(body: registerRequestModel),
      ).thenAnswer(
        (_) async =>registerResponseModel
      );
      final result = await authRepoImplementation.register(
        authRequestModel: registerRequestModel,
      );
      result.fold((_) => null, (right) {
        expect(
          right.userData,
          registerResponseModel.userData.token,
        );
      });
    });

    test(
      "should return Left(Failure) when register fails with bad status",
      () async {
        when(
          () => mockAuthApiService.register(body: registerRequestModelFailed),
        ).thenThrow(failure);
        final result = await authRepoImplementation.register(
          authRequestModel: registerRequestModelFailed,
        );
        expect(result.isLeft(), true);
        expect(result, isA<Either<Failure, RegisterResponseEntity>>());
      },
    );
  });
}
