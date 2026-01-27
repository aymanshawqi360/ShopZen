import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/notworking/dio_factory.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/login_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/register_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

final sl = GetIt.instance;
Future<void> setupDependencies() async {
  await _setupCore();
  await _auth();
}

Future<void> _setupCore() async {
  //Dio
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());
  //EnvConfig
  sl.registerLazySingleton<EnvConfig>(() => EnvConfig());
  //FlutterSecureStorage
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  //FlutterSecureStorageImpl
  sl.registerLazySingleton<FlutterSecureStorageImpl>(
    () => FlutterSecureStorageImpl(
      flutterSecureStorage: sl<FlutterSecureStorage>(),
    ),
  );
}

Future<void> _auth() async {
  //ApiService
  sl.registerLazySingleton<AuthApiService>(() => AuthApiService(sl()));

  //RepoImplementation
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepoImplementation(apiService: sl()),
  );

  //UseCases

  //Register
  sl.registerLazySingleton<RegisterUseCases>(
    () => RegisterUseCases(authRepository: sl()),
  );
  //Login
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(authRepository: sl()),
  );

  //Cubit
  
  //Register Cubit
  sl.registerFactory(
    () => RegisterCubit(
      registerUseCases: sl(),
      flutterSecureStorageImpl: sl(),
      envConfig: sl(),
    ),
  );
  //Login Cubit
  sl.registerFactory(() => LoginCubit(loginUseCases: sl()));
}
