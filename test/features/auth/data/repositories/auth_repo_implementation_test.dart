import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/forgot_password_response_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/data/model/login/login_request_model.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/core/Shared/model/auth/auth_response_model.dart';
import 'package:shopzen/feature/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:shopzen/core/Shared/auth/entity/auth_response_entity.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';

class MockAuthApiService extends Mock implements AuthApiService {}

void main() {
  late MockAuthApiService mockAuthApiService;
  late AuthRepoImplementation authRepoImplementation;
  late RegisterRequestModel registerRequestModel;
  late AuthResponseModel registerResponseModel;
  late RegisterRequestModel registerRequestModelFailed;
  late LoginRequestModel loginRequestModel;
  late LoginRequestModel loginRequestModelFailed;
  late ForgotPasswordRequestModel forgotPasswordRequestModel;
  late ForgotPasswordRequestModel forgotPasswordRequestModelFailed;
  late ForgotPasswordResponseModel forgotPasswordResponseModel;
  late ForgotPasswordResponseModel forgotPasswordResponseFailureModel;
  late Failure failure;
  late UserData userData;
  late ResendOtpRequestModel resendOtpRequestModelSuccess;
  late ResendOtpRequestModel resendOtpRequestModelFailure;
  late ResetPasswordRequestMode resetPasswordRequestMode;
  late ResetPasswordRequestMode resetPasswordRequestFailureMode;
  setUp(() {
    forgotPasswordResponseFailureModel = ForgotPasswordResponseModel(
      message: 'failed',
      status: 400,
    );
    resetPasswordRequestFailureMode = ResetPasswordRequestMode(
      email: "test2001@gmail",
    );
    resetPasswordRequestMode = ResetPasswordRequestMode(
      email: "test2001@gmail.com",
    );
    forgotPasswordResponseModel = ForgotPasswordResponseModel(
      message: "success",
      status: 200,
    );
    forgotPasswordRequestModelFailed = ForgotPasswordRequestModel(
      email: "test2001@gmai",
    );
    mockAuthApiService = MockAuthApiService();
    authRepoImplementation = AuthRepoImplementation(
      apiService: mockAuthApiService,
    );
    forgotPasswordRequestModel = ForgotPasswordRequestModel(
      email: "test2001@gmail.com",
    );
    registerRequestModel = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      password: "Test123456789@",
      confirmPassword: "Test123456789@",
      phone: "512345675",
      countryCode: "SA",
    );

    userData = UserData(
      token: "dslkdsaldksalkwqewqpdlpqldpldsad5s4d56sdsa564dsa5d4sa56ds",
    );

    registerResponseModel = AuthResponseModel(
      status: 200,
      message: "success",
      userData: userData,
    );

    registerRequestModelFailed = RegisterRequestModel(
      lastName: "ayman",
      firstName: "shawqi",
      email: "test2001@gmail.com",
      phone: "512345678",
      password: "test123456789",
      confirmPassword: "test123456789",
      countryCode: "SA",
    );

    failure = Failure(
      errorData: {
        "password": ["The password field format is invalid."],
      },
    );

    loginRequestModel = LoginRequestModel(
      email: "test2001@gmail.com",
      password: "Test123456789@",
    );
    loginRequestModelFailed = LoginRequestModel(
      email: "test2001@gmail.com",
      password: "test123456789",
    );

    resendOtpRequestModelSuccess = ResendOtpRequestModel(
      email: "test2001@gmail.com",
      otp: '',
    );
    resendOtpRequestModelFailure = ResendOtpRequestModel(
      email: "test2001@gmail",
      otp: '',
    );
  });

  group("Test register method in auth repo", () {
    test("should return session when login is successful", () async {
      when(
        () => mockAuthApiService.register(body: registerRequestModel),
      ).thenAnswer((_) async => registerResponseModel);
      final result = await authRepoImplementation.register(
        authRequestModel: registerRequestModel,
      );
      result.fold((_) => null, (right) {
        expect(right.status, 200);
        expect(right.userData, registerResponseModel.userData.token);
      });
    });

    test(
      "should return Left(Failure) when register fails with bad status",
      () async {
        when(
          () => mockAuthApiService.register(body: registerRequestModelFailed),
        ).thenThrow(failure);
        final result = await authRepoImplementation.register(
          authRequestModel: registerRequestModelFailed,
        );
        expect(result.isLeft(), true);
        expect(result, isA<Either<Failure, AuthResponseEntity>>());
      },
    );
  });

  group('Test login method', () {
    test('should return session when login is successful', () async {
      when(
        () => mockAuthApiService.login(body: loginRequestModel),
      ).thenAnswer((_) async => registerResponseModel);

      final result = await authRepoImplementation.login(
        authRequestModel: loginRequestModel,
      );
      result.fold((_) => null, (right) {
        expect(right.status, 200);

        expect(right.userData, registerResponseModel.userData.token);
      });
    });
    test('should return session when login is failure', () async {
      when(
        () => mockAuthApiService.login(body: loginRequestModelFailed),
      ).thenThrow(failure);
      final result = await authRepoImplementation.login(
        authRequestModel: loginRequestModelFailed,
      );
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<Failure>());
      }, (_) => null);
    });
  });

  group(" Test forgotPassword method", () {
    test("should return session when forgot password is successful", () async {
      when(
        () =>
            mockAuthApiService.forgotPassword(body: forgotPasswordRequestModel),
      ).thenAnswer((_) async => forgotPasswordResponseModel);

      final result = await authRepoImplementation.forgotPassword(
        authRequestModel: forgotPasswordRequestModel,
      );
      result.fold((_) => null, (right) {
        expect(right.status, 200);
        expect(right.message, "success");
      });
    });

    test("should return session when forgot password is failure", () async {
      when(
        () => mockAuthApiService.forgotPassword(
          body: forgotPasswordRequestModelFailed,
        ),
      ).thenThrow(
        Failure(
          errorData: {
            "status": 404,
            "errors": {"message": "No account found with this email"},
          },
        ),
      );

      final result = await authRepoImplementation.forgotPassword(
        authRequestModel: forgotPasswordRequestModelFailed,
      );

      expect(result, isA<Either<Failure, ForgotPasswordEntity>>());
      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<Failure>());
      }, (_) => null);
    });
  });

  group(" Test resendOtp method ", () {
    test("should return ResendOtp when resend otp is successful", () async {
      when(
        () => mockAuthApiService.otpVerification(body: resendOtpRequestModelSuccess),
      ).thenAnswer((_) async => forgotPasswordResponseModel);

      final resutls = await authRepoImplementation.resendOtp(
        resendOtpRequestModel: resendOtpRequestModelSuccess,
      );

      expect(resutls.isRight(), true);
      resutls.fold((_) => null, (i) {
        expect(i.message, "success");
        expect(i.status, 200);
      });
    });

    test("should return  ResendOtp when resend otp is failure", () async {
      when(
        () => mockAuthApiService.otpVerification(body: resendOtpRequestModelFailure),
      ).thenThrow({
        "status": 404,
        "errors": {"message": "No account found with this email"},
      });

      final result = await authRepoImplementation.resendOtp(
        resendOtpRequestModel: resendOtpRequestModelFailure,
      );

      expect(result.isLeft(), true);
      expect(result, isA<Either<Failure, ForgotPasswordEntity>>());
      result.fold((failure) {
        expect(failure, isA<Failure>());
      }, (_) => null);
    });
  });

  group('Test resetPassword method', () {
    test('should return session when reset password is successful', () async {
      when(
        () => mockAuthApiService.resetPassword(body: resetPasswordRequestMode),
      ).thenAnswer((_) async => forgotPasswordResponseModel);

      final result = await authRepoImplementation.resetPassword(
        resetPasswordRequestMode: resetPasswordRequestMode,
      );

      expect(result.isRight(), true);
      result.fold((_) => null, (r) {
        expect(r.status, 200);
        expect(r.message, "success");
      });
    });

    test('should return session when reset password is failure', () async {
      when(
        () => mockAuthApiService.resetPassword(
          body: resetPasswordRequestFailureMode,
        ),
      ).thenAnswer((_) async => forgotPasswordResponseFailureModel);
      final result = await authRepoImplementation.resetPassword(
        resetPasswordRequestMode: resetPasswordRequestFailureMode,
      );
      expect(result.isLeft(), true);
      result.fold((f) {
        expect(f.errorCode, 400);
        expect(f.errorMessage, "The operation failed.");
      }, (_) => null);
    });
  });
}
