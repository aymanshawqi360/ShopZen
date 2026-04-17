import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/implementations/encryption_service_impl.dart';
import 'package:shopzen/core/security/interfaces/i_secure_storage.dart';

class MockSecureStorage extends Mock implements ISecureStorage {}

void main() {
  late EncryptionServiceImpl encryptionServiceImpl;
  late MockSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    encryptionServiceImpl = EncryptionServiceImpl(
      flutterSecureStorageImpl: mockSecureStorage,
    );
  });

  ///This test is for encrypt and decrypt

  test("encrypt and decrypt", () async {
    String? storedKey = "";

    const testData = "sdsadsad5sadsa5d4sa5d4sa5d4sads";
    when(
      () => mockSecureStorage.read(key: any(named: 'key')),
    ).thenAnswer((_) async => Right(storedKey));
    when(
      () => mockSecureStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((invocation) async {
      storedKey = invocation.namedArguments[Symbol('value')] as String;

      return Right(null);
    });

    //Special test in encryption
    final resultEncrypt = await encryptionServiceImpl.encrypt(
      plaintext: testData,
    );
    expect(resultEncrypt.isRight(), true);
    expect(resultEncrypt, isA<Either<Failure, String>>());
    String ifRightEncrypt = resultEncrypt.fold((_) => "", (ifRight) {
      expect(ifRight, isA<String>());
      expect(ifRight, isNotEmpty);
      return ifRight.toString();
    });

    debugPrint(ifRightEncrypt);

    ///Special test in decryption
    when(
      () => mockSecureStorage.read(key: any(named: 'key')),
    ).thenAnswer((_) async => Right(storedKey));
    final resultDecrypt = await encryptionServiceImpl.decrypt(
      cipherText: ifRightEncrypt,
    );
    expect(resultDecrypt.isRight(), true);
    expect(resultDecrypt, isA<Either<Failure, String>>());
    final isRightDecrypt = resultDecrypt.fold(
      (f) {
        expect(f, isA<Failure>());
        debugPrint(f.errorMessage);
      },
      (ifRight) {
        expect(ifRight, isA<String>());
        return ifRight;
      },
    );

    debugPrint(isRightDecrypt.toString());
  });
}
