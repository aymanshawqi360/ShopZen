import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/implementations/encryption_service_impl.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';

class MockFlutterSecureStorageImpl extends Mock
    implements FlutterSecureStorageImpl {}

class MokeEnvConfig extends Mock implements EnvConfig {}

void main() {
  late EncryptionServiceImpl encryptionServiceImpl;
  late MockFlutterSecureStorageImpl mockFlutterSecureStorageImpl;
  late MokeEnvConfig envConfig;

  setUp(() {
    mockFlutterSecureStorageImpl = MockFlutterSecureStorageImpl();
    envConfig = MokeEnvConfig();
    encryptionServiceImpl = EncryptionServiceImpl(
      flutterSecureStorage: mockFlutterSecureStorageImpl,
      envConfig: envConfig,
    );
  });

  ///This test is for encrypt and decrypt
  test("encrypt and decrypt", () async {
    const value = "sdsadsad5sadsa5d4sa5d4sa5d4sads";
    String? storedKey = "";

    when(() => envConfig.getEncryptionKey()).thenReturn('encryption_key');

    when(
      () => mockFlutterSecureStorageImpl.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((invocation) async {
      storedKey = invocation.namedArguments[Symbol('value')] as String;
      return Right(null);
    });
    when(
      () => mockFlutterSecureStorageImpl.read(key: any(named: 'key')),
    ).thenAnswer((_) async => Right(storedKey));

    //Special test in encryption
    final resultEncrypt = await encryptionServiceImpl.encrypt(plaintext: value);
    expect(resultEncrypt.isRight(), true);
    expect(resultEncrypt, isA<Either<Failure, String>>());
    String ifRightEncrypt = resultEncrypt.fold((_) => "", (ifRight) {
      expect(ifRight, isA<String>());
      expect(ifRight, isNotEmpty);
      return ifRight;
    });
    debugPrint(ifRightEncrypt);

    ///Special test in decryption
    final resultDecrypt = await encryptionServiceImpl.decrypt(
      cipherText: ifRightEncrypt,
    );
    expect(resultDecrypt.isRight(), true);
    expect(resultDecrypt, isA<Either<Failure, String>>());
    final isRightDecrypt = resultDecrypt.fold((_) => null, (ifRight) {
      expect(ifRight, isA<String>());
      return ifRight;
    });

    debugPrint(isRightDecrypt.toString());
  });
}
