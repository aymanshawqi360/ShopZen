import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/security/interfaces/i_encryption_service.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/domain/use_cases/login_use_cases.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;
  final IEncryptionService iEncryptionService;
  LoginCubit({required this.loginUseCases, required this.iEncryptionService})
    : super(LoginInitial());

  Future<void> login({required LoginRequestModel body}) async {
    emit(LoginLoading());
    final result = await loginUseCases.login(
      authRequestModel: LoginRequestModel(
        email: body.email,
        password: body.password,
      ),
    );
    result.fold(
      (failure) {
        emit(
          LoginFailure(
            messageError: Failure(
              errorData: failure.errorData,
              errorMessage: failure.errorMessage,
              errorCode: failure.errorCode,
            ),
          ),
        );
      },
      (response) {
        iEncryptionService.encrypt(plaintext: response.userData ?? "");
        emit(LoginSuccess());
      },
    );
  }
}
