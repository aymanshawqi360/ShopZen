import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/core/error/failure_message.dart';
import 'package:shopzen/core/security/implementations/flutter_secure_storage_impl.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/resend_otp_request_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/reset_password_request_mode.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/resend_otp_use_cases.dart';
import 'package:shopzen/feature/auth/domain/use_cases/reset_password_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';

class MockEnvConfig extends Mock implements EnvConfig {}

class MockForgotPasswordUseCases extends Mock
    implements ForgotPasswordUseCases {}

class MockFlutterSecureStorageImpl extends Mock
    implements FlutterSecureStorageImpl {}

class MockResendOtpUseCases extends Mock implements ResendOtpUseCases {}

class MockStorageErrorModel extends Mock implements StorageErrorModel {}

class MockResetPasswordUseCases extends Mock implements ResetPasswordUseCases {}

void main() {
  // ===== forgot password =====
  late MockEnvConfig mockEnvConfig;
  late VerifyEmailCubit forgotPasswordCubit;
  late MockForgotPasswordUseCases mockForgotPasswordUseCases;
  late ForgotPasswordRequestModel forgotPasswordRequestModel;
  late MockFlutterSecureStorageImpl mockFlutterSecureStorageImpl;

  // ===== resend otp =====
  late MockResendOtpUseCases mockResendOtpUseCases;
  late ResendOtpCubit resendOtpCubit;
  late ForgotPasswordEntity forgotPasswordSuccessEntity;
  late MockStorageErrorModel mockStorageErrorModel;
  late Failure failure;

  // ===== reset password =====
  late MockResetPasswordUseCases mockResetPasswordUseCases;

  setUpAll(() {
    registerFallbackValue(
      ResendOtpRequestModel(email: 'Test@email.com', otp: '000000'),
    );
    registerFallbackValue(ResetPasswordRequestMode(email: 'dummy@email.com'));
  });

  setUp(() {
    // ===== reset password =====
    mockResetPasswordUseCases = MockResetPasswordUseCases();

    mockEnvConfig = MockEnvConfig();

    mockFlutterSecureStorageImpl = MockFlutterSecureStorageImpl();

    forgotPasswordRequestModel = ForgotPasswordRequestModel(
      email: "test2001@gmail.com",
    );

    mockForgotPasswordUseCases = MockForgotPasswordUseCases();
    forgotPasswordCubit = VerifyEmailCubit(
      envConfig: mockEnvConfig,
      forgotPasswordUseCases: mockForgotPasswordUseCases,
      flutterSecureStorage: mockFlutterSecureStorageImpl,
    );

    mockResendOtpUseCases = MockResendOtpUseCases();
    mockStorageErrorModel = MockStorageErrorModel();
    resendOtpCubit = ResendOtpCubit(
      resetPasswordUseCases: mockResetPasswordUseCases,
      resendOtpUseCases: mockResendOtpUseCases,
      flutterSecureStorage: mockFlutterSecureStorageImpl,
      envConfig: mockEnvConfig,
    );
    when(
      () => mockEnvConfig.getEncryptionEmail(),
    ).thenReturn('encryption_email_key');

    forgotPasswordSuccessEntity = ForgotPasswordEntity(
      status: 200,
      message: "success",
    );

    failure = Failure(
      errorCode: 400,
      errorMessage: "failed",
      errorData: {
        "email": ["The email field is required."],
      },
    );
  });

  // ===== forgot password =====
  group('Test Forgot Password', () {
    blocTest<VerifyEmailCubit, VerifyEmailState>(
      "should emit [ForgotPasswordLoading, ForgotPasswordSuccess] when all data is loaded successfully",
      build: () {
        when(
          () => mockFlutterSecureStorageImpl.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((_) async {
          return Right(null);
        });
        when(
          () => mockForgotPasswordUseCases.forgotPassword(
            forgotPasswordRequestModel: forgotPasswordRequestModel,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            ForgotPasswordEntity(message: "success", status: 200),
          ),
        );

        return forgotPasswordCubit;
      },
      act: (bloc) {
        bloc.forgotPassword(body: forgotPasswordRequestModel);
      },
      expect: () {
        return [VerifyEmailLoading(), VerifyEmailSuccess()];
      },
    );
    blocTest(
      "should emit [ForgotPasswordLoading, ForgotPasswordFailure] when all data is not loaded failure",
      build: () {
        when(
          () => mockFlutterSecureStorageImpl.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((_) async => Left(mockStorageErrorModel));
        when(
          () => mockForgotPasswordUseCases.forgotPassword(
            forgotPasswordRequestModel: forgotPasswordRequestModel,
          ),
        ).thenAnswer(
          (invocation) async =>
              const Left(Failure(errorMessage: "error", errorCode: 400)),
        );
        return forgotPasswordCubit;
      },
      act: (bloc) {
        bloc.forgotPassword(body: forgotPasswordRequestModel);
      },
      expect: () {
        return [
          VerifyEmailLoading(),
          const VerifyEmailFailure(
            errorMessage: Failure(errorMessage: "error", errorCode: 400),
          ),
        ];
      },
    );
  });

  // ===== resend otp =====
  group("Test Resend Otp", () {
    blocTest<ResendOtpCubit, ResendOtpState>(
      "should emit ResendOtpLoading and ResendOtpSuccess",
      build: () {
        when(
          () => mockFlutterSecureStorageImpl.read(key: "encryption_email_key"),
        ).thenAnswer((_) async {
          return Right('test2001@gmail.com');
        });

        when(
          () => mockResendOtpUseCases.resendOtp(
            resendOtpRequestModel: any(named: "resendOtpRequestModel"),
          ),
        ).thenAnswer((_) async => Right(forgotPasswordSuccessEntity));
        return resendOtpCubit;
      },
      act: (bloc) async {
        await bloc.resendOtp(otp: "353293");
      },
      expect: () => [ResendOtpLoading(), ResendOtpSuccess()],
    );

    blocTest<ResendOtpCubit, ResendOtpState>(
      "should emit ResendOtpLoading and ResendOtpFailure",
      build: () {
        when(
          () => mockFlutterSecureStorageImpl.read(key: "encryption_email_key"),
        ).thenAnswer((_) async {
          return Left(mockStorageErrorModel);
        });
        when(
          () => mockResendOtpUseCases.resendOtp(
            resendOtpRequestModel: any(named: "resendOtpRequestModel"),
          ),
        ).thenAnswer((_) async => Left(failure));

        return resendOtpCubit;
      },
      act: (bloc) async {
        await bloc.resendOtp(otp: "35329");
      },
      expect: () {
        return [ResendOtpLoading(), isA<ResendOtpFailure>()];
      },
    );
  });

  blocTest(
    "should emit ResetPasswordLoading and ResetPasswordSuccess",
    build: () {
      when(
        () => mockFlutterSecureStorageImpl.read(key: any(named: 'key')),
      ).thenAnswer((_) async => Right("test2001@gmail.com"));
      when(
        () => mockResetPasswordUseCases.resetPassword(
          resetPasswordRequestMode: any(named: "resetPasswordRequestMode"),
        ),
      ).thenAnswer((_) async => Right(forgotPasswordSuccessEntity));
      return resendOtpCubit;
    },
    act: (bloc) async {
      bloc.envConfig;
      bloc.flutterSecureStorage;
      bloc.resendOtpUseCases;
      await bloc.resetPassword();
    },
    expect: () {
      return [ResetPasswordLoading(), ResetPasswordSuccess()];
    },
  );

  //==== reset password ====
  blocTest(' should emit ResetPasswordLoading and ResetPasswordFailure', build: () {
    when(
      () => mockFlutterSecureStorageImpl.read(key: any(named: 'key')),
    ).thenAnswer((_) async => Left(mockStorageErrorModel));
    when(
      () => mockResetPasswordUseCases.resetPassword(
        resetPasswordRequestMode: any(named: "resetPasswordRequestMode"),
      ),
    ).thenAnswer((_) async => Left(failure));
    return resendOtpCubit;
  }, act: (bloc) async {
    bloc.envConfig;
    bloc.flutterSecureStorage;
    bloc.resendOtpUseCases;
    await bloc.resetPassword();
  }, expect: () {
    return [ResetPasswordLoading(), isA<ResetPasswordFailure>()];
  });

  blocTest('should emit ResetPasswordLoading and ResetPasswordSuccess', build: () {
    when(
      () => mockFlutterSecureStorageImpl.read(key: any(named: 'key')),
    ).thenAnswer((_) async => Right("test2001@gmail.com"));
    when(
      () => mockResetPasswordUseCases.resetPassword(
        resetPasswordRequestMode: any(named: "resetPasswordRequestMode"),
      ),
    ).thenAnswer((_) async => Right(forgotPasswordSuccessEntity));
    return resendOtpCubit;
  }, act: (bloc) async {
    bloc.envConfig;
    bloc.flutterSecureStorage;
    bloc.resendOtpUseCases;
    await bloc.resetPassword();
  }, expect: () {
    return [ResetPasswordLoading(), ResetPasswordSuccess()];
  });
}
