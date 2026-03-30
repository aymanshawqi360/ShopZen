import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/interfaces/i_encryption_service.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:shopzen/core/security/interfaces/i_secure_storage.dart';

class EncryptionServiceImpl implements IEncryptionService {
  final ISecureStorage flutterSecureStorageImpl;
  final EnvConfig envConfig;

  const EncryptionServiceImpl({
    required this.flutterSecureStorageImpl,
    required this.envConfig,
  });

  //Encrypt data
  @override
  Future<Either<Failure, String>> encrypt({required String plaintext}) async {
    try {
      final key = await _createAndSaveKey();
      final iv = enc.IV.fromSecureRandom(16);
      final encrypter = enc.Encrypter(
        enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'),
      );
      final encrypt = encrypter.encrypt(plaintext, iv: iv);
      final encode = base64Url.encode(iv.bytes + encrypt.bytes);
      if (encode.isNotEmpty) {
        flutterSecureStorageImpl.write(key: "token", value: encode);
      } else {
        return Left(Failure(errorMessage: StoargeFailureMessage.noToken));
      }
      return Right(encode);
    } catch (e) {
      return Left(Failure(errorMessage: StoargeFailureMessage.failedToDecrypt));
    }
  }

  //Decrypt data
  @override
  Future<Either<Failure, String>> decrypt({required String cipherText}) async {
    try {
      final key = await _createAndSaveKey();
      /*
      if (cipherText == null || cipherText.isEmpty) {
        return Left(Failure(errorMessage: StoargeFailureMessage.noToken));
      }
      */
      Uint8List decode = base64Url.decode(cipherText);
      final iv = enc.IV(decode.sublist(0, 16));
      final cipher = enc.Encrypted(decode.sublist(16));
      final encrypter = enc.Encrypter(
        enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'),
      );
      final decrypt = encrypter.decrypt(cipher, iv: iv);
      return Right(decrypt);
    } catch (e) {
      return Left(Failure(errorMessage: StoargeFailureMessage.failedToDecrypt));
    }
  }

  Future<enc.Key> _createAndSaveKey() async {
    final key = await flutterSecureStorageImpl.read(
      key: envConfig.encryptKey,
      // envConfig.getEncryptionKey(),
    );

    String? keyValue = key.fold((_) => null, (key) => key);
    if (keyValue != null && keyValue.isNotEmpty) {
      final byte = base64Url.decode(keyValue);
      return enc.Key(Uint8List.fromList(byte));
    }
    final random = Random.secure();
    final keyBytes = List<int>.generate(32, (index) => random.nextInt(256));
    final encode = base64UrlEncode(keyBytes);
    await flutterSecureStorageImpl.write(
      key: envConfig.encryptKey,
      value: encode,
    );
    return enc.Key(Uint8List.fromList(keyBytes));
  }
}
