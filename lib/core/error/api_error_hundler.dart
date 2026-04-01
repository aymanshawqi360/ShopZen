import 'package:dio/dio.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/api_error_messages.dart';

class ApiErrorHundler {
  static Failure errorHundel(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return Failure(errorMessage: ApiErrorMessages.cancel);

        case DioExceptionType.connectionTimeout:
          return Failure(errorMessage: ApiErrorMessages.connectionTimeout);

        case DioExceptionType.sendTimeout:
          return Failure(errorMessage: ApiErrorMessages.sendTimeout);

        case DioExceptionType.receiveTimeout:
          return Failure(errorMessage: ApiErrorMessages.receiveTimeout);

        case DioExceptionType.badCertificate:
          return Failure(errorMessage: ApiErrorMessages.badCertificate);

        case DioExceptionType.badResponse:
          return handleBadResponse(data: error.response);

        case DioExceptionType.connectionError:
          return Failure(errorMessage: ApiErrorMessages.connectionError);

        case DioExceptionType.unknown:
          return Failure(errorMessage: ApiErrorMessages.unknown);
      }
    }
    return Failure(errorMessage: 'nknown error occurred');
  }

  static Failure handleBadResponse({required Response<dynamic>? data}) {
    return Failure(
      errorMessage: data?.data["message"] ?? ApiErrorMessages.unknownError,
      errorData: data?.data["errors"] ?? {},
    );
  }
}
