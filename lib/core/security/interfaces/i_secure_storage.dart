import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/stoarge_failure_message.dart';


/// Interface for secure storage operations

abstract class ISecureStorage {
  /// Writes a value to secure storage
  Future<Either<StorageErrorModel, void>> write({
    required String key,
    required String value,
  });

  /// Reads a value from secure storage
  Future<Either<StorageErrorModel, String?>> read({required String key});

  /// Deletes a value from secure storage
  Future<Either<StorageErrorModel, void>> delete({required String key});

  /// Deletes all values from secure storage
  Future<Either<StorageErrorModel, void>> deleteAll();

  /// Checks if a key exists in secure storage
  Future<Either<StorageErrorModel, bool>> containsKey({required String key});

  /// Reads all keys from secure storage
  Future<Either<StorageErrorModel, Map<String, String>>> readAll();
}
