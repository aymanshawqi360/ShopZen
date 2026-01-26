import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';


abstract class IEncryptionService {
  /// Encrypts plain text and returns a base64Url-encoded blob.
  
  Future<Either<Failure, String>> encrypt({required String plaintext});
//String plaintext

  /// Decrypts a base64Url-encoded blob and returns the original plain text.
  Future<Either<Failure, String>> decrypt({required String cipherText});
  
}