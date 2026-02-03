import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class ResetPasswordUseCases {
  final AuthRepository authRepository;
  ResetPasswordUseCases({required this.authRepository});

  Future<Either<Failure, ForgotPasswordEntity>> resetPassword({
    required ResetPasswordRequestMode resetPasswordRequestMode,
  }) => authRepository.resetPassword(
    resetPasswordRequestMode: resetPasswordRequestMode,
  );
}
