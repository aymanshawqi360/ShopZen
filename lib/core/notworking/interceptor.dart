import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';
import 'package:shopzen/core/security/interfaces/i_refresh_token.dart';

class ApiInterceptorsWrapper extends Interceptor {
  final ITokenDecrtyption iDecryptToken;
  final ITokenRefresh iRefreshToken;
  // final Dio dio;

  const ApiInterceptorsWrapper({
    // required this.dio,
    required this.iDecryptToken,
    required this.iRefreshToken,
  });
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      Either<Failure, String> result = await iDecryptToken.decryptToken();

      return result.fold(
        (failure) {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: "Security/Storage Error: ${failure.errorMessage}",
              type: DioExceptionType.badResponse,
            ),
          );
        },
        (token) {
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
            debugPrint("Token added successfully: [ONREQUEST]");
            return handler.next(options);
          } else {
            return handler.reject(
              DioException(
                requestOptions: options,
                error: "No Token Found",
                type: DioExceptionType.badResponse,
              ),
            );
          }
        },
      );
    } catch (e) {
      debugPrint("Interceptor Error: $e");
      return handler.reject(
        DioException(requestOptions: options, error: e.toString()),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      "ERORR[${err.response?.statusCode}] => PATH : ${err.requestOptions.path}",
    );

    if (err.response?.statusCode == 401) {
      if (err.requestOptions.path.contains("refresh")) {
        debugPrint("Token refresh failed. Directing to logout.");
        return handler.reject(err);
      }
      try {
        final dio = sl<Dio>();
        Either<Failure, void> refreshResult = await iRefreshToken
            .getRefreshToken();

        if (refreshResult.isRight()) {
          final dd = await iDecryptToken.decryptToken();
          final String? token = dd.fold((l) => null, (r) => r);
          if (token != null && token.isNotEmpty) {
            RequestOptions opts = err.requestOptions;
            opts.headers["Authorization"] = "Bearer $token";
            debugPrint("Token refreshed and retried successfully!");
            final response = await dio.fetch(opts);
            return handler.resolve(response);
          }
        }
      } catch (e) {
        debugPrint("Error during token decryption after refresh: $e");
        return handler.reject(err);
      }
    }

    return super.onError(err, handler);
  }
}

@override
void onResponse(Response response, ResponseInterceptorHandler handler) {
  debugPrint("[RESPONSE] : ${response.statusCode}");
  return handler.next(response);
}
