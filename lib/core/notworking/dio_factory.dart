import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopzen/core/constants/api_constants.dart';

class DioFactory {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiBasUrl.baseUrl,
        receiveDataWhenStatusError:
            ApiDefaults.shouldReceiveDataWhenStatusError,
        connectTimeout: ApiConnectTimeout.connectTimeout,
        receiveTimeout: ApiConnectTimeout.receiveTimeout,
        headers: APiHeaders.headers,
      ),
    );
  
    if (kDebugMode) {
      dio.interceptors.add(
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
    return dio;
  }
}
