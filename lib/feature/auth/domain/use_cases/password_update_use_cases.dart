import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/password_update_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class PasswordUpdateUseCases {
  final AuthRepository authRepository;

  const PasswordUpdateUseCases({required this.authRepository, });

  Future<Either<Failure, ForgotPasswordEntity>> passwordUpdate({
    required PasswordUpdateRequestModel passwordUpdateRequestModel,
  }) => authRepository.passwrodUpdate(
    passwordUpdateRequestModel: passwordUpdateRequestModel,
  );
}
