import 'package:dartz/dartz.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/register_response_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';

class RegisterUseCases {
  final AuthRepository authRepository;
  RegisterUseCases({required this.authRepository});

  Future<Either<Failure,AuthResponseEntity>> register({required RegisterRequestModel authRequestModel}) => authRepository.register(authRequestModel: authRequestModel );
}