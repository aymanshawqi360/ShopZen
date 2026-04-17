import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_hundler.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';

class TokenDecryptionImpl extends ITokenDecrtyption {
  TokenDecryptionImpl({
    required super.encryptionService,
    required super.iSecureStorage,
  });

  @override
  Future<Either<Failure, String>> decryptToken() async {
    try {
      Either<StorageErrorModel, String?> accessTokenResult =
          await iSecureStorage.read(key: EnvConfig.instance.token);
      return await accessTokenResult.fold(
        (storageError) {
          return Left(ApiErrorHundler.errorHundel(storageError));
        },
        (encryptedToken) async {
          if (encryptedToken == null || encryptedToken.isEmpty) {
            return Left(Failure(errorMessage: (StoargeFailureMessage.noToken)));
          }
          Either<Failure, String> decryptedResult = await encryptionService
              .decrypt(cipherText: encryptedToken);
          return decryptedResult.fold(
            (failure) => Left(ApiErrorHundler.errorHundel(failure)),
            (finalToken) {
              if (finalToken.isNotEmpty) {
                return Right(finalToken);
              } else {
                return Left(
                  Failure(
                    errorMessage: (StoargeFailureMessage.decryptedTokenIsEmpty),
                  ),
                );
              }
            },
          );
        },
      );
    } catch (e) {
      debugPrint("Unexpected Error during token decryption: $e");
      return Left(ApiErrorHundler.errorHundel(e));
    }
  }
}
