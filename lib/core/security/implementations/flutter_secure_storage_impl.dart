import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/interfaces/i_secure_storage.dart';

class FlutterSecureStorageImpl implements ISecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  FlutterSecureStorageImpl({
    required FlutterSecureStorage? flutterSecureStorage,
  }) : _flutterSecureStorage =
           flutterSecureStorage ??
           const FlutterSecureStorage(
             aOptions: AndroidOptions(
               encryptedSharedPreferences: true,
               resetOnError: true,
             ),
             iOptions: IOSOptions(
               accessibility: KeychainAccessibility.first_unlock,
             ),
             mOptions: MacOsOptions(
               accessibility: KeychainAccessibility.first_unlock,
             ),
           );
  @override
  Future<Either<StorageErrorModel, bool>> containsKey({
    required String key,
  }) async {
    try {
      bool isExist = await _flutterSecureStorage.containsKey(key: key);
      return Right(isExist);
    } catch (e) {
      return Left(
        DataNotFoundFailure(message: StoargeFailureMessage.keyNotFound),
      );
    }
  }

  @override
  Future<Either<StorageErrorModel, void>> delete({required String key}) async {
    try {
      await _flutterSecureStorage.delete(key: key);
      return Right(null);
    } catch (e) {
      return Left(StorageDeleteFailure());
    }
  }

  @override
  Future<Either<StorageErrorModel, void>> deleteAll() async {
    try {
      await _flutterSecureStorage.deleteAll();
      return Right(null);
    } catch (error) {
      return Left(StorageDeleteAllFailure());
    }
  }

  @override
  Future<Either<StorageErrorModel, String?>> read({required String key}) async {
    try {
      String? reas = await _flutterSecureStorage.read(key: key);
      return Right(reas);
    } catch (e) {
      return Left(StorageReadFailure());
    }
  }

  @override
  Future<Either<StorageErrorModel, Map<String, String>>> readAll() async {
    try {
      final reasAll = await _flutterSecureStorage.readAll();
      return Right(reasAll);
    } catch (e) {
      return Left(StorageReadAllFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<StorageErrorModel, void>> write({
    required String key,
    required String value,
  }) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
      return Right(null);
    } catch (e) {
      return Left(StorageWriteFailure());
    }
  }
}
