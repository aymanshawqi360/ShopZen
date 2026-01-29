import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCases forgotPasswordUseCases;
  ForgotPasswordCubit({required this.forgotPasswordUseCases})
    : super(ForgotPasswordInitial());

  Future<void> forgotPassword({
    required ForgotPasswordRequestModel body,
  }) async {
    emit(ForgotPasswordLoading());
    final result = await forgotPasswordUseCases.forgotPassword(
      forgotPasswordRequestModel: body,
    );
    result.fold(
      (failure) {
        emit(
          ForgotPasswordFailure(
            errorMessage: Failure(
              errorData: failure.errorData,
              errorMessage: failure.errorMessage,
              errorCode: failure.errorCode,
            ),
          ),
        );
      },
      (response) {
        emit(ForgotPasswordSuccess());
      },
    );
  }
}
