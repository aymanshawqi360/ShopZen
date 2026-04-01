import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/password_update_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/use_cases/password_update_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/password_update/password_update_cubit.dart';

class MokePasswordUpdateUseCases extends Mock
    implements PasswordUpdateUseCases {}

class MokeFlutterSecureStorageImpl extends Mock
    implements FlutterSecureStorageImpl {}

class MokeEnvConfig extends Mock implements EnvConfig {}

void main() {
  late MokeEnvConfig mokeEnvConfig;
  late MokePasswordUpdateUseCases mokePasswordUpdateUseCases;
  late MokeFlutterSecureStorageImpl mokeFlutterSecureStorageImpl;
  late PasswordUpdateCubit passwordUpdateCubit;

  setUp(() {
    registerFallbackValue(
      PasswordUpdateRequestModel(email: '', oldPassword: '', newPassword: ''),
    );
    mokeEnvConfig = MokeEnvConfig();
    mokePasswordUpdateUseCases = MokePasswordUpdateUseCases();
    mokeFlutterSecureStorageImpl = MokeFlutterSecureStorageImpl();
    passwordUpdateCubit = PasswordUpdateCubit(
      passwordUpdateUseCases: mokePasswordUpdateUseCases,
      flutterSecureStorage: mokeFlutterSecureStorageImpl,
      envConfig: mokeEnvConfig,
    );
  });

  blocTest<PasswordUpdateCubit, PasswordUpdateState>(
    "emits [PasswordUpdateLoading, PasswordUpdateSuccess] when passwordUpdate is called",

    build: () {
      when(() => mokeEnvConfig.getEncryptionEmail()).thenReturn("my_key");
      when(
        () => mokeFlutterSecureStorageImpl.read(key: any(named: 'key')),
      ).thenAnswer((_) async => const Right("test2001@gmail.com"));

      when(
        () => mokePasswordUpdateUseCases.passwordUpdate(
          passwordUpdateRequestModel: any(named: 'passwordUpdateRequestModel'),
        ),
      ).thenAnswer(
        (_) async =>
            const Right(ForgotPasswordEntity(status: 200, message: "success")),
      );

      return passwordUpdateCubit;
    },
    act: (bloc) => bloc.passwordUpdate(
      confirmPassword: "Test123456789#",
      newPassword: "Test123456789#",
    ),
    expect: () => [PasswordUpdateLoading(), PasswordUpdateSuccess()],
  );
  blocTest(
    "emits [PasswordUpdateLoading, PasswordUpdateFailure(errorMessage: Failure(errorMessage: 'error'))] when passwordUpdate is called",
    build: () {
      when(() => mokeEnvConfig.getEncryptionEmail()).thenReturn("my_key");
      when(
        () => mokeFlutterSecureStorageImpl.read(key: any(named: 'key')),
      ).thenAnswer((_) async => Left(StorageErrorModel(message: "error")));
      when(
        () => mokePasswordUpdateUseCases.passwordUpdate(
          passwordUpdateRequestModel: any(named: 'passwordUpdateRequestModel'),
        ),
      ).thenAnswer((_) async => Left(Failure(errorMessage: "error")));
      return passwordUpdateCubit;
    },
    act: (bloc) => bloc.passwordUpdate(
      confirmPassword: "Test123456789#",
      newPassword: "Test123456789",
    ),
    expect: () => [
      PasswordUpdateLoading(),
      PasswordUpdateFailure(errorMessage: Failure(errorMessage: "error")),
    ],
  );
}
