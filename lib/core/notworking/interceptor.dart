import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/config/network_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';
import 'package:shopzen/core/security/interfaces/i_token_refresh.dart';

class ApiInterceptorsWrapper extends Interceptor {
  final ITokenDecrtyption iDecryptToken;
  final ITokenRefresh iRefreshToken;
  final Dio _dio;
  const ApiInterceptorsWrapper(
    this._dio, {
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
      // if (options.path.contains("login") || options.path.contains("signUp")) {
      //   return handler.next(options); // مرر الطلب مباشرة للسيرفر
      // }
      return result.fold(
        (_) {
          // return handler.next(options);
          log("Authentication required but decryption failed.");
          // return handler.reject(
          //   DioException(
          //     requestOptions: options,
          //     error: "Authentication required but decryption failed.",
          //   ),
          // );
          return handler.next(options);
        },
        (token) {
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
            debugPrint("Token added successfully: [ONREQUEST]");
            log("Token added successfully: [ONREQUEST]");
          }
          log("Token added successfully: [ONREQUEST]");
          return handler.next(options);
        },
      );
    } catch (failure) {
      debugPrint("Interceptor Error: $failure");
      log("Interceptor Error: $failure");
      return handler.next(options);
      // return handler.reject(
      //   DioException(
      //     requestOptions: options,
      //     error: "An error occurred during authentication setup.",
      //   ),
      // );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("[RESPONSE] : ${response.statusCode}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      "ERORR[${err.response?.statusCode}] => PATH : ${err.requestOptions.path}",
    );

    if (err.response?.statusCode == NetworkConfig.statusUnauthorized &&
        !err.requestOptions.path.contains("refresh")) {
      try {
        Either<Failure, void> refreshResult = await iRefreshToken
            .getRefreshToken();

        if (refreshResult.isRight()) {
          final dd = await iDecryptToken.decryptToken();
          final String? token = dd.fold((l) => null, (r) => r);
          if (token != null && token.isNotEmpty) {
            RequestOptions opts = err.requestOptions;
            opts.headers["Authorization"] = "Bearer $token";
            debugPrint("Token refreshed and retried successfully!");
            final response = await _dio.fetch(opts);
            return handler.resolve(response);
          }
        }
      } catch (e) {
        debugPrint("Error during token decryption after refresh: $e");
        return handler.reject(err);
      }
    } else {
      debugPrint("Token refresh failed. Directing to logout.");
      return handler.reject(err);
    }

    return super.onError(err, handler);
  }
}
