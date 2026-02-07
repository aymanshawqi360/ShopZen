import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/resend_otp_use_cases.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ResendOtpUseCases resendOtpUseCases;
  late ForgotPasswordEntity forgotPasswordEntity;
  late ResendOtpRequestModel resendOtpRequestSuccessModel;
  late ResendOtpRequestModel resendOtpRequestFailureModel;
  late Failure failure;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    resendOtpUseCases = ResendOtpUseCases(authRepository: mockAuthRepository);
    resendOtpRequestSuccessModel = ResendOtpRequestModel(
      email: "test2001@gmail.com",
      otp: "35329",
    );

    forgotPasswordEntity = ForgotPasswordEntity(
      status: 200,
      message: "success",
    );
    resendOtpRequestFailureModel = ResendOtpRequestModel(
      email: "test2001@gmail",
      otp: "35329"
    );
    failure = Failure(errorMessage: "failed", errorCode: 400);
  });

  test('should return ResendOtpUseCase success', () async {
    when(
      () => mockAuthRepository.resendOtp(
        resendOtpRequestModel: resendOtpRequestSuccessModel,
      ),
    ).thenAnswer((_) async => Right(forgotPasswordEntity));

    final result = await resendOtpUseCases.resendOtp(
      resendOtpRequestModel: resendOtpRequestSuccessModel,
    );

    expect(result.isRight(), true);
    result.fold((_) => null, (ifRight) {
      expect(ifRight.message, "success");
      expect(ifRight.status, 200);
    });
  });

  test('should return ResendOtpUseCase failure', ()async {
    when(
      () => mockAuthRepository.resendOtp(
        resendOtpRequestModel: resendOtpRequestFailureModel,
      ),
    ).thenAnswer((_) async => Left(failure));

    final result =await resendOtpUseCases.resendOtp(resendOtpRequestModel: resendOtpRequestFailureModel);
    expect(result.isLeft(), true);
    result.fold((ifLeft){
      expect(ifLeft,failure);
    }, (_)=>null);
  });
}
