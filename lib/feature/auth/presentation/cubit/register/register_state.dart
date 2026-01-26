part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}


final class RegisterLoading extends RegisterState{}
final class RegisterSuccess extends RegisterState{}
final class RegisterFailure extends RegisterState{
  final Failure errorMessage;

  const RegisterFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}


final class RegisterCountryCode extends RegisterState{
  final String countryCode;
  const RegisterCountryCode({required this.countryCode});
  @override
  List<Object> get props => [countryCode];
}