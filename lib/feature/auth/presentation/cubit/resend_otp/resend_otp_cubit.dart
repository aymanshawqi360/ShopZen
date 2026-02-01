import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/domain/use_cases/resend_otp_use_cases.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpUseCases resendOtpUseCases;
  final FlutterSecureStorageImpl flutterSecureStorage;
  // final StorageErrorModel storageErrorModel;
  final EnvConfig envConfig;
  ResendOtpCubit({
    required this.envConfig,
    required this.resendOtpUseCases,
    required this.flutterSecureStorage,
    // required this.storageErrorModel,
  }) : super(ResendOtpInitial());

  String _email = "";
  Future<void> resendOtp({required String otp}) async {
    emit(ResendOtpLoading());
    Either<StorageErrorModel, String?> email = await flutterSecureStorage.read(
      key: envConfig.getEncryptionEmail()
    );
    email.fold(
      (l) {
        emit(
          ResendOtpFailure(
            errorMessage: Failure(errorMessage: l.message),
          ),
        );
      },
      (r) async {
        final result = await resendOtpUseCases.resendOtp(
          resendOtpRequestModel: ResendOtpRequestModel(email: _email, otp: otp),
        );

        result.fold(
          (failure) {
            emit(
              ResendOtpFailure(
                errorMessage: Failure(
                  errorData: failure.errorData,
                  errorMessage: failure.errorMessage,
                  errorCode: failure.errorCode,
                ),
              ),
            );
          },
          (response) {
            emit(ResendOtpSuccess());
          },
        );
      },
    );
  }
}
