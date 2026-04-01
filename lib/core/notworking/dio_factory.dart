import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopzen/core/constants/api_constants.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/notworking/interceptor.dart';
import 'package:shopzen/core/security/interfaces/i_token_decryption.dart';
import 'package:shopzen/core/security/interfaces/i_token_refresh.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio createDio() {
    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiBasUrl.baseUrl,
          receiveDataWhenStatusError:
              ApiDefaults.shouldReceiveDataWhenStatusError,
          connectTimeout: ApiConnectTimeout.connectTimeout,
          receiveTimeout: ApiConnectTimeout.receiveTimeout,
          headers: APiHeaders.headers,
        ),
      );

      _cleateInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _cleateInterceptor() {
    if (kDebugMode) {
      dio!.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
        ),
      );
    }
    dio!.interceptors.add(
      ApiInterceptorsWrapper(
        iDecryptToken: sl<ITokenDecrtyption>(),
        iRefreshToken: sl<ITokenRefresh>(),
      ),
    );
  }
}
