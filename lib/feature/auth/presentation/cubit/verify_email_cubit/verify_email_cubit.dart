import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';
part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final ForgotPasswordUseCases forgotPasswordUseCases;
  final FlutterSecureStorageImpl flutterSecureStorage;
  final EnvConfig envConfig;
  VerifyEmailCubit({
    required this.forgotPasswordUseCases,
    required this.flutterSecureStorage,
    required this.envConfig,
  }) : super(VerifyEmailInitial());

  Future<void> forgotPassword({
    required ForgotPasswordRequestModel body,
  }) async {
    emit(VerifyEmailLoading());
    await flutterSecureStorage.write(
      key: envConfig.getEncryptionEmail(),
      value: body.email ?? "",
    );
    final result = await forgotPasswordUseCases.forgotPassword(
      forgotPasswordRequestModel: body,
    );

    result.fold(
      (failure) {
        emit(
          VerifyEmailFailure(
            errorMessage: Failure(
              errorData: failure.errorData,
              errorMessage: failure.errorMessage,
              errorCode: failure.errorCode,
            ),
          ),
        );
      },
      (response) {
        emit(VerifyEmailSuccess());
      },
    );
  }
}
