import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/otp_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ForgotPasswordUseCases forgotPasswordUseCases;
  late ForgotPasswordRequestModel forgotPasswordRequestModel;
  setUp(() {
    forgotPasswordRequestModel = ForgotPasswordRequestModel(
      email: "test2001@gmail.com",
    );
    mockAuthRepository = MockAuthRepository();
    forgotPasswordUseCases = ForgotPasswordUseCases(
      authRepository: mockAuthRepository,
    );
  });

  test("should return ForgotPasswordUseCase success ", () async {
    when(
      () => mockAuthRepository.forgotPassword(
        authRequestModel: forgotPasswordRequestModel,
      ),
    ).thenAnswer(
      (_) async => Right(ForgotPasswordEntity(message: "success", status: 200)),
    );

    final result = await forgotPasswordUseCases.forgotPassword(
      forgotPasswordRequestModel: forgotPasswordRequestModel,
    );
    expect(result.isRight(), true);
    result.fold(
      (_) => null,
      (r) => {expect(r.status, 200), expect(r.message, "success")},
    );
  });

  test("should return ForgotPasswordUseCase failure", () async {
    when(
      () => mockAuthRepository.forgotPassword(
        authRequestModel: forgotPasswordRequestModel,
      ),
    ).thenAnswer(
      (_) async => Left(Failure(errorCode: 400, errorMessage: "error")),
    );

    final result = await forgotPasswordUseCases.forgotPassword(
      forgotPasswordRequestModel: forgotPasswordRequestModel,
    );
    expect(result.isLeft(), true);
    result.fold((l) {
      expect(l.errorCode, 400);
      expect(l.errorMessage, "error");
    }, (_) => null);
  });
}
