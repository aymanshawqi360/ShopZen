import 'package:dartz/dartz.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class LoginUseCases {
  final AuthRepository authRepository;

  LoginUseCases({required this.authRepository});

  Future<Either<Failure, AuthResponseEntity>> login({
    required LoginRequestModel authRequestModel,
  }) => authRepository.login(authRequestModel: authRequestModel);
}
