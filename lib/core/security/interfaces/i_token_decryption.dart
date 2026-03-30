import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_encryption_service.dart';
import 'package:shopzen/core/security/interfaces/i_secure_storage.dart';

abstract class ITokenDecrtyption {
  final ISecureStorage iSecureStorage;
  final IEncryptionService encryptionService;

  const ITokenDecrtyption({
    required this.iSecureStorage,
    required this.encryptionService,
  });
  Future<Either<Failure, String>> decryptToken();
}
