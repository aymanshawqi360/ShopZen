part of 'resend_otp_cubit.dart';

sealed class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpSuccess extends ResendOtpState {}

final class ResendOtpFailure extends ResendOtpState {
  final Failure errorMessage;

  const ResendOtpFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ResetPasswordLoading extends ResendOtpState {}

final class ResetPasswordSuccess extends ResendOtpState {}

final class ResetPasswordFailure extends ResendOtpState {
  final Failure errorMessage;

  const ResetPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}


final class IsButtonDisabled extends ResendOtpState{
  final bool isButtonDisabled;
  const IsButtonDisabled({required this.isButtonDisabled});
  @override
  List<Object> get props => [isButtonDisabled];}

  final class ResendOtpCounter extends ResendOtpState{
   final int counter;
 const   ResendOtpCounter({ required this.counter});
  @override
  List<Object> get props => [counter];}
