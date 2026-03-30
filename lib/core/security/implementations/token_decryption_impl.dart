import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/interfaces/i_decrypt_token.dart';

class TokenDecryptionImpl extends ITokenDecrtyption {
  TokenDecryptionImpl({
    required super.encryptionService,
    required super.iSecureStorage,
  });

  @override
  Future<Either<Failure, String>> decryptToken() async {
    try {
      Either<StorageErrorModel, String?> accessTokenResult =
          await iSecureStorage.read(key: "token");
      if (accessTokenResult.isLeft()) {
        return throw Exception();
      }

      final String? encryptedToken = accessTokenResult.fold(
        (l) => null,
        (r) => r,
      );
      if (encryptedToken == null || encryptedToken.isEmpty) {
        throw Exception();
      }

      final Either<Failure, String> decryptedResult = await encryptionService
          .decrypt(cipherText: encryptedToken);

      if (decryptedResult.isLeft()) {
        throw Exception();
      }

      final String finalToken = decryptedResult.fold((l) => "", (r) => r);

      if (finalToken.isNotEmpty) {
        return Right(finalToken);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint("Error during token decryption: $e");
      rethrow;
    }
  }
}
