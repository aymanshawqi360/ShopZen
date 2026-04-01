import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';

abstract class ITokenRefresh {
  final ITokenDecrtyption iDecryptToken;

  const ITokenRefresh({required this.iDecryptToken});
  Future<Either<Failure, void>> getRefreshToken();
}
