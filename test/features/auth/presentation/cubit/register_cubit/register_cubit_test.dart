import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/feature/auth/domain/use_cases/register_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

class MockRegisterUseCases extends Mock implements RegisterUseCases {}

class MockFlutterSecureStorageImpl extends Mock
    implements FlutterSecureStorageImpl {}

class MockEnvConfig extends Mock implements EnvConfig {}

void main() {
  late MockRegisterUseCases mockRegisterUseCases;
  late MockFlutterSecureStorageImpl mockFlutterSecureStorageImpl;
  late MockEnvConfig mockEnvConfig;
  late RegisterCubit registerCubit;
  late RegisterRequestModel registerRequestModel;
  late RegisterRequestModel egisterRequestFailureModel;
  setUp(() {
    mockRegisterUseCases = MockRegisterUseCases();
    mockFlutterSecureStorageImpl = MockFlutterSecureStorageImpl();

    mockEnvConfig = MockEnvConfig();
    registerCubit = RegisterCubit(
      registerUseCases: mockRegisterUseCases,
      flutterSecureStorageImpl: mockFlutterSecureStorageImpl,
      envConfig: mockEnvConfig,
    );

    registerRequestModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      phone: "51234567",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      countryCode: "SA",
    );

    egisterRequestFailureModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      phone: "5123456789",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      countryCode: "SA",
    );
  });
  

     group("register cubit test", () {
       blocTest<RegisterCubit, RegisterState>(
    'emits [RegisterLoading, RegisterSuccess] when register is called successfully',
    build: () {
      when(() => mockEnvConfig.getEncryptionToken()).thenReturn("token");
      when(
        () => mockFlutterSecureStorageImpl.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => const Right(null));
      when(
        () => mockRegisterUseCases.register(
          authRequestModel: registerRequestModel,
        ),
      ).thenAnswer(
        (_) async =>
            Right(AuthResponseEntity(message: "success", status: 200)),
      );

      return registerCubit;
    },
    act: (bloc) async => bloc.register(body: registerRequestModel),
    expect: () => [RegisterLoading(), RegisterSuccess()],
  );
  
  blocTest(
    "emits [RegisterLoading, RegisterFailure] when register is failed",
    build: () {
      when(() => mockEnvConfig.getEncryptionToken()).thenReturn("token");
      when(
        () => mockFlutterSecureStorageImpl.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => const Right(null));
      when(
        () => mockRegisterUseCases.register(
          authRequestModel: egisterRequestFailureModel,
        ),
      ).thenAnswer(
        (_) async => Left(
          Failure(
            errorMessage: "error",
            errorCode: 400,
            errorData: {
              'phone': ['The phone must be a valid phone number.'],
            },
          ),
        ),
      );
      return registerCubit;
    },
    act: (bloc) => bloc.register(body: egisterRequestFailureModel),
    expect: () => [
      RegisterLoading(),
      RegisterFailure(
        errorMessage: Failure(
          errorMessage: "error",
          errorCode: 400,
          errorData: {
            'phone': ['The phone must be a valid phone number.'],
          },
        ),
      ),
    ],
  );
     });
  
}
