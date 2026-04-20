import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopzen/core/constants/api_constants.dart';
import 'package:shopzen/core/error/api_error_hundler.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/notworking/endpoints.dart';
import 'package:shopzen/core/security/interfaces/i_token_refresh.dart';

class TokenRefreshImpl extends ITokenRefresh {
  TokenRefreshImpl({required super.iDecryptToken});
  @override
  Future<Either<Failure, void>> getRefreshToken() async {
    try {
      final rr = await iDecryptToken.decryptToken();
      if (rr.isLeft()) {
        throw Exception();
      }
      String data = rr.fold((_) => '', (ifRight) => ifRight);
      Response response = await Dio().post(
        "${ApiBasUrl.baseUrl}${Endpoints.refreshToken}",
        options: Options(headers: {"Authorization": "Bearer $data"}),
      );
      if (response.statusCode != 200 &&
          response.data["data"]["access_token"] == null) {
        throw Exception();
      }
      await iDecryptToken.encryptionService.encrypt(
        response.data["data"]["access_token"],
      );

      return Right(null);
    } catch (error) {
      return Left(ApiErrorHundler.errorHundel(error));
    }
  }
}
