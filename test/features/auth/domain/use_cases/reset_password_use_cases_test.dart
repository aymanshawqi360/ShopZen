import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/reset_password_use_cases.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ResetPasswordUseCases resetPasswordUseCases;
  late ResetPasswordRequestMode resetPasswordRequestMode;
  late ResetPasswordRequestMode resetPasswordRequestFailureMode;
  late ForgotPasswordEntity forgotPasswordEntity;
  late Failure failure;
  setUp(() {
    failure =Failure(errorMessage: "failed", errorCode: 400);
    resetPasswordRequestFailureMode = ResetPasswordRequestMode(
      email: "test2001@gmail",
    );
    forgotPasswordEntity=ForgotPasswordEntity(status: 200, message: "success");
    mockAuthRepository = MockAuthRepository();
    resetPasswordUseCases = ResetPasswordUseCases(
      authRepository: mockAuthRepository,
    );
    resetPasswordRequestMode = ResetPasswordRequestMode(
      email: "test2001@gmail.com",
    );
  });

  test('should return ResetPasswordUseCase success', ()async {
    when(
      () => mockAuthRepository.resetPassword(
        resetPasswordRequestMode: resetPasswordRequestMode,
      ),
    ).thenAnswer(
      (_) async => Right(forgotPasswordEntity),
    );

    final result=await resetPasswordUseCases.resetPassword(
      resetPasswordRequestMode: resetPasswordRequestMode,
    );
    expect(result.isRight(), true);
    result.fold(
      (_) => null,
      (r) => {expect(r.status, 200), expect(r.message, "success")},
    );
  });

  test('should return ResetPasswordUseCase failure', ()async {
     when(()=> mockAuthRepository.resetPassword(
       resetPasswordRequestMode: resetPasswordRequestFailureMode,
     )).thenAnswer(
       (_) async => Left(failure));
       final result =await resetPasswordUseCases.resetPassword(
         resetPasswordRequestMode: resetPasswordRequestFailureMode,
       );

       expect(result.isLeft(), true);
       result.fold((failure){
         expect(failure.errorMessage, "failed");
         expect(failure.errorCode, 400);
       }, (_)=>null);
  });
}
