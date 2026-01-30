import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/core/error/api_error_model.dart';
import 'package:shopzen/feature/auth/data/model/change_password/forgot_password_request_model.dart';
import 'package:shopzen/feature/auth/domain/entity/forgot_password_entity.dart';
import 'package:shopzen/feature/auth/domain/repo/auth_repository.dart';
import 'package:shopzen/feature/auth/domain/use_cases/forgot_password_use_cases.dart';
import 'package:shopzen/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockForgotPasswordUseCubit extends Mock implements ForgotPasswordCubit {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ForgotPasswordCubit forgotPasswordCubit;
  late ForgotPasswordUseCases forgotPasswordUseCases;
 late ForgotPasswordRequestModel forgotPasswordRequestModel;
  setUp(() {
    forgotPasswordRequestModel =  ForgotPasswordRequestModel(
      email: "test2001@gmail.com",
    );
    mockAuthRepository = MockAuthRepository();
    forgotPasswordUseCases = ForgotPasswordUseCases(
      authRepository: mockAuthRepository,
    );
    forgotPasswordCubit = ForgotPasswordCubit(
      forgotPasswordUseCases: forgotPasswordUseCases,
    );
  });

  blocTest<ForgotPasswordCubit, ForgotPasswordState>(
    "should emit [ForgotPasswordLoading, ForgotPasswordSuccess] when all data is loaded successfully",
    build: () {
      when(
        () => mockAuthRepository.forgotPassword(
          authRequestModel: forgotPasswordRequestModel,
        ),
      ).thenAnswer(
        (invocation) async =>
            const Right(ForgotPasswordEntity(message: "success", status: 200)),
      );
      return forgotPasswordCubit;
    },
    act: (bloc) {
      bloc.forgotPassword(body: forgotPasswordRequestModel);
    },
    expect: () {
      return [
         ForgotPasswordLoading(),
         ForgotPasswordSuccess(),
      ];
    },
  );
  blocTest("should emit [ForgotPasswordLoading, ForgotPasswordFailure] when all data is not loaded failure", 
  build: () {
    when(
      () => mockAuthRepository.forgotPassword(
        authRequestModel: forgotPasswordRequestModel,
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
       ForgotPasswordLoading(),
       const ForgotPasswordFailure(errorMessage: Failure(errorMessage: "error", errorCode: 400)),
    ];
  },
  );
}
