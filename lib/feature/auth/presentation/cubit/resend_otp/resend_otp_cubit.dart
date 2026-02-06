import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/domain/use_cases/resend_otp_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/reset_password_use_cases.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpUseCases resendOtpUseCases;
  final ResetPasswordUseCases resetPasswordUseCases;
  final FlutterSecureStorageImpl flutterSecureStorage;

  final EnvConfig envConfig;
  ResendOtpCubit({
    required this.envConfig,
   required this.resetPasswordUseCases,
    required this.resendOtpUseCases,
    required this.flutterSecureStorage,
  }) : super(ResendOtpInitial());

  //==== resend otp ===
  Future<void> resendOtp({required String otp}) async {
    emit(ResendOtpLoading());
    Either<StorageErrorModel, String?> email = await flutterSecureStorage.read(
      key: envConfig.getEncryptionEmail(),
    );
    email.fold(
      (l) {
        emit(ResendOtpFailure(errorMessage: Failure(errorMessage: l.message)));
      },
      (r) async {
        final result = await resendOtpUseCases.resendOtp(
          resendOtpRequestModel: ResendOtpRequestModel(email: r, otp: otp),
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
          (response){


            emit(ResendOtpSuccess());
          },
        );
      },
    );
  }

  // ==== reset password ====
  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    Either<StorageErrorModel, String?> email = await flutterSecureStorage.read(
      key: envConfig.getEncryptionEmail(),
    );
    email.fold(
      (l) {
        emit(
          ResetPasswordFailure(errorMessage: Failure(errorMessage: l.message)),
        );
      },
      (r) async {
        final result = await resetPasswordUseCases.resetPassword(
          resetPasswordRequestMode: ResetPasswordRequestMode(email: r),
        );
        result.fold(
          (failure) {
            emit(
              ResetPasswordFailure(
                errorMessage: Failure(
                  errorData: failure.errorData,
                  errorMessage: failure.errorMessage,
                  errorCode: failure.errorCode,
                ),
              ),
            );
          },
          (response) {

            emit(ResetPasswordSuccess());
          },
        );
      },
    );
  }
int  _start = 60;
bool isButtonDisabled =true;
  void startTimer() {
    isButtonDisabled = false;
    emit(IsButtonDisabled(isButtonDisabled: isButtonDisabled));
     _start = 60;
    
    Timer.periodic(Duration(seconds: 1), (timer) {
      
        if (_start == 0) {
          isButtonDisabled = true;
          emit(IsButtonDisabled(isButtonDisabled: isButtonDisabled));
          timer.cancel();
        } else {
          _start--;
          emit(ResendOtpCounter(counter: _start));
          
        }
      
    });
  }
}
