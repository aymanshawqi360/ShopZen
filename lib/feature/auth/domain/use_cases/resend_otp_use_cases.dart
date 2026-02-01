import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class ResendOtpUseCases {
  final AuthRepository authRepository;

  const ResendOtpUseCases({required this.authRepository});

  Future<Either<Failure, ForgotPasswordEntity>> resendOtp({
    required ResendOtpRequestModel resendOtpRequestModel,
  }) => authRepository.resendOtp(resendOtpRequestModel: resendOtpRequestModel);
}
