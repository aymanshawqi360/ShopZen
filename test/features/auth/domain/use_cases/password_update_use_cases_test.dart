import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/password_update_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/password_update_use_cases.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late PasswordUpdateUseCases passwordUpdateUseCases;
  late PasswordUpdateRequestModel passwordUpdateRequestModelSuccess;
  late PasswordUpdateRequestModel passwordUpdateRequestModelFailure;

  setUp(() {
    passwordUpdateRequestModelFailure = PasswordUpdateRequestModel(
      email: "test2001@gmail.com",
      oldPassword: "Test123456789",
      newPassword: "Test123456789",
    );
    passwordUpdateRequestModelSuccess = PasswordUpdateRequestModel(
      email: "test2001@gmail.com",
      oldPassword: "Test123456789@",
      newPassword: "Test123456789@",
    );
    mockAuthRepository = MockAuthRepository();
    passwordUpdateUseCases = PasswordUpdateUseCases(
      authRepository: mockAuthRepository,
    );
  });
  
  test('should return PasswordUpdateUseCase success', () async{
    when(
      () => mockAuthRepository.passwrodUpdate(
        passwordUpdateRequestModel: passwordUpdateRequestModelSuccess,
      ),
    ).thenAnswer(
      (_) async => Right(ForgotPasswordEntity(message: "success", status: 200)),
    );
    final result =await passwordUpdateUseCases.passwordUpdate(
      passwordUpdateRequestModel: passwordUpdateRequestModelSuccess
    );
    expect(result.isRight(), true);
    result.fold((ifRight){
      expect(ifRight.errorCode,200);
      expect(ifRight.errorMessage,"success");
    }, (_)=>null);
  });

  test('test name', () async{
     when(()=>mockAuthRepository.passwrodUpdate(
       passwordUpdateRequestModel: passwordUpdateRequestModelFailure,
     )).thenAnswer((_)async=>Left(Failure(errorMessage: "failed", errorCode: 400)));

     final result =await passwordUpdateUseCases.passwordUpdate(
         passwordUpdateRequestModel: passwordUpdateRequestModelFailure
     );
     expect(result.isLeft(), true);
     result.fold((ifLeft){
     expect(ifLeft.errorCode,400);
     expect(ifLeft.errorMessage,"failed");
     }, (_)=>null);
  });
}
