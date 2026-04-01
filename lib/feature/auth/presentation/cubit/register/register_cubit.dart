import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_encryption_service.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/feature/auth/domain/use_cases/register_use_cases.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCases registerUseCases;
  final IEncryptionService iEncryptionService;
  RegisterCubit({
    required this.registerUseCases,
    required this.iEncryptionService,
  }) : super(RegisterInitial());
  final formKey = GlobalKey<FormState>();

  Future<void> register({required RegisterRequestModel body}) async {
    try {
      emit(RegisterLoading());
      Either<Failure, AuthResponseEntity> response = await registerUseCases
          .register(authRequestModel: body);
      response.fold(
        (ifLeft) {
          emit(
            RegisterFailure(
              errorMessage: Failure(
                errorData: ifLeft.errorData,
                errorMessage: ifLeft.errorMessage,
                errorCode: ifLeft.errorCode,
              ),
            ),
          );
        },
        (ifRight) {
          iEncryptionService.encrypt(plaintext: ifRight.userData ?? "");
          emit(RegisterSuccess());
        },
      );
    } catch (error) {
      emit(
        RegisterFailure(errorMessage: Failure(errorMessage: error.toString())),
      );
    }
  }

  /// Use this function to input the country code
  String countryCode = "";
  void getCountryCode({required String countryCode}) {
    this.countryCode = countryCode;
    emit(RegisterCountryCode(countryCode: this.countryCode));
  }
}
