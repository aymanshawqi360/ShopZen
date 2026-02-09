import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/password_update_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/use_cases/password_update_use_cases.dart';

part 'password_update_state.dart';

class PasswordUpdateCubit extends Cubit<PasswordUpdateState> {
  final PasswordUpdateUseCases passwordUpdateUseCases;
  final FlutterSecureStorageImpl flutterSecureStorage;
  final EnvConfig envConfig;
  PasswordUpdateCubit({
    required this.passwordUpdateUseCases,
    required this.envConfig,
    required this.flutterSecureStorage,
  }) : super(PasswordUpdateInitial());

  Future<void> passwordUpdate({
    required String confirmPassword,
    required String newPassword,
  }) async {
    emit(PasswordUpdateLoading());
    Either<StorageErrorModel, String?>? email = await flutterSecureStorage.read(
      key: envConfig.getEncryptionEmail(),
    );

    email.fold(
      (l) {
        emit(
          PasswordUpdateFailure(errorMessage: Failure(errorMessage: l.message)),
        );
      },
      (r) async {
      Either<Failure, ForgotPasswordEntity> result=  await passwordUpdateUseCases.passwordUpdate(
          passwordUpdateRequestModel: PasswordUpdateRequestModel(
            email: r.toString(),
            oldPassword: confirmPassword,
            newPassword: newPassword,
          ),
        );
        result.fold(
          (failure) {
            emit(
              PasswordUpdateFailure(
                errorMessage: Failure(
                  errorData: failure.errorData,
                  errorMessage: failure.errorMessage,
                  errorCode: failure.errorCode,
                ),
              ),
            );
          },
          (response) {
            emit(PasswordUpdateSuccess());
          },
        );
      
      },
    );
  }
}
