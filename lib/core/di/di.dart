import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/notworking/dio_factory.dart';
import 'package:shopzen/core/security/implementations/decrypt_token_impl.dart';
import 'package:shopzen/core/security/implementations/encryption_service_impl.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/core/security/implementations/token_refresh_impl.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';
import 'package:shopzen/core/security/interfaces/i_encryption_service.dart';
import 'package:shopzen/core/security/interfaces/i_token_refresh.dart';
import 'package:shopzen/core/security/interfaces/i_secure_storage.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/login_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/password_update_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/register_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/resend_otp_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/reset_password_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/password_update/password_update_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:shopzen/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:shopzen/feature/home/data/repo_implementation/home_repo_implementation.dart';
import 'package:shopzen/feature/home/domain/repo/home_repo.dart';
import 'package:shopzen/feature/home/domain/use_cases/category_use_cases.dart';
import 'package:shopzen/feature/home/presentation/cubit/category/category_cubit.dart';

final sl = GetIt.instance;
Future<void> setupDependencies() async {
  // Dio dio = await DioFactory.createDio();
  await _setupCore();
  await _auth();
  await _home();
}

Future<void> _setupCore() async {
  //===== EnvConfig =====
  sl.registerLazySingleton<EnvConfig>(() => EnvConfig());

  //===== FlutterSecureStorage =====
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());

  //===== FlutterSecureStorageImpl =====
  sl.registerLazySingleton<ISecureStorage>(
    () => FlutterSecureStorageImpl(
      flutterSecureStorage: sl<FlutterSecureStorage>(),
    ),
  );
  // ===== EncryptionService =====
  sl.registerLazySingleton<IEncryptionService>(
    () => EncryptionServiceImpl(
      flutterSecureStorageImpl: sl<ISecureStorage>(),
      envConfig: sl(),
    ),
  );
  // ===== IDecryptToken =====
  sl.registerLazySingleton<ITokenDecrtyption>(
    () => TokenDecryptionImpl(encryptionService: sl(), iSecureStorage: sl()),
  );

  // ===== IRefreshToken =====
  sl.registerLazySingleton<ITokenRefresh>(
    () => TokenRefreshImpl(iDecryptToken: sl()),
  );

  //===== Dio =====
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());
}

Future<void> _auth() async {
  //===== ApiService =====
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl()));

  //===== RepoImplementation =====
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepoImplementation(apiService: sl(), iEncryptionService: sl()),
  );

  //===== UseCases =====

  //Register
  sl.registerLazySingleton<RegisterUseCases>(
    () => RegisterUseCases(authRepository: sl()),
  );
  //Login
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(authRepository: sl()),
  );
  //ForgotPassword
  sl.registerLazySingleton<ForgotPasswordUseCases>(
    () => ForgotPasswordUseCases(authRepository: sl()),
  );

  //ResendOtp
  sl.registerLazySingleton<ResendOtpUseCases>(
    () => ResendOtpUseCases(authRepository: sl()),
  );

  //ResetPassword
  sl.registerLazySingleton<ResetPasswordUseCases>(
    () => ResetPasswordUseCases(authRepository: sl()),
  );
  //PasswrodUpdate
  sl.registerLazySingleton<PasswordUpdateUseCases>(
    () => PasswordUpdateUseCases(authRepository: sl()),
  );

  //===== Cubit =====

  //Register Cubit
  sl.registerFactory(
    () => RegisterCubit(
      registerUseCases: sl(),

      envConfig: sl(),
      iEncryptionService: sl(),
    ),
  );
  //Login Cubit
  sl.registerFactory(
    () => LoginCubit(loginUseCases: sl(), iEncryptionService: sl()),
  );

  //ForgotPassword Cubit
  sl.registerFactory(
    () => VerifyEmailCubit(
      forgotPasswordUseCases: sl(),
      flutterSecureStorage: sl(),
      envConfig: sl(),
    ),
  );

  //ResendOtp Cubit
  sl.registerFactory(
    () => ResendOtpCubit(
      flutterSecureStorage: sl(),
      resetPasswordUseCases: sl(),
      resendOtpUseCases: sl(),
      envConfig: sl(),
    ),
  );
  sl.registerFactory(
    () => PasswordUpdateCubit(
      passwordUpdateUseCases: sl(),
      envConfig: sl(),
      flutterSecureStorage: sl(),
    ),
  );
}

Future<void> _home() async {
  //===== ApiService =====
  sl.registerLazySingleton<HomeApiService>(() => HomeApiService(sl()));

  //===== Data Layer =====
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplementation(homeApiService: sl()),
  );

  //===== Domain Layer =====
  sl.registerLazySingleton<CategoryUseCases>(
    () => CategoryUseCases(homeRepo: sl()),
  );
  //===== Cubit =====
  sl.registerFactory(() => CategoryCubit(categoryUseCases: sl()));
}
