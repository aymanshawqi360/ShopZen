part of 'resend_otp_cubit.dart';

sealed class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

final class ResendOtpInitial extends ResendOtpState {}
final class  ResendOtpLoading extends ResendOtpState {}
final class ResendOtpSuccess extends ResendOtpState {}
final class ResendOtpFailure extends ResendOtpState {
  final Failure errorMessage;

  const ResendOtpFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
