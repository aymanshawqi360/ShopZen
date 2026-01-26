import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_form_screen.dart';
import 'package:shopzen/l10n/app_localizations.dart';

class MockRegisterCubit extends Mock implements RegisterCubit {}

void main() {
  
  late MockRegisterCubit mockRegisterCubit;
  late GlobalKey<FormState> formKey;
  late RegisterRequestModel registerRequestModel;
  setUp(() {
    //registerRequestModel = MockRegisterCubit();
    mockRegisterCubit = MockRegisterCubit();
    registerRequestModel = RegisterRequestModel(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@example.com',
      password: '123456',
      phone: '',
      confirmPassword: '',
      countryCode: '',
    );
  
    formKey = GlobalKey<FormState>();
    when(() => mockRegisterCubit.state).thenReturn(RegisterInitial());
    when(
      () => mockRegisterCubit.stream,
    ).thenAnswer((_) => const Stream.empty());
  });

  
  testWidgets("checkUserValue should call register when form is valid", (WidgetTester tester) async {
   

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: BlocProvider<RegisterCubit>.value(
              value: mockRegisterCubit,
              child: Scaffold(body: RegisterFormScreen()),
            ),
          );
        },
      ),
    );
    expect(find.byKey(const Key('first_name')), findsOneWidget);
    expect(find.byKey(const Key('last_name')), findsOneWidget);
    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);
    expect(find.byKey(const Key('confirm_password')), findsOneWidget);
    expect(find.byKey(const Key('phone')), findsOneWidget);
    
    await tester.enterText(find.byKey(const Key('first_name')), 'Ayman');
    await tester.enterText(find.byKey(const Key('last_name')), 'Shawqi');
    await tester.enterText(find.byKey(const Key('email')), 'test155@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), 'Test123456789@');
    await tester.enterText(find.byKey(const Key('confirm_password')), 'Test123456789@');
   



   
  });
}
