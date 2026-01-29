import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/otp_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';


class ForgotPasswordUseCases {
  final AuthRepository authRepository;

  const ForgotPasswordUseCases({required this.authRepository,});
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword({
    required ForgotPasswordRequestModel forgotPasswordRequestModel,
  }) {
    return authRepository.forgotPassword(
      authRequestModel: forgotPasswordRequestModel,
    );
  }
}
