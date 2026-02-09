part of 'password_update_cubit.dart';

sealed class PasswordUpdateState extends Equatable {
  const PasswordUpdateState();

  @override
  List<Object> get props => [];
}

final class PasswordUpdateInitial extends PasswordUpdateState {}
final class PasswordUpdateLoading extends PasswordUpdateState {}
final class PasswordUpdateSuccess extends PasswordUpdateState {}
final class PasswordUpdateFailure extends PasswordUpdateState {
  final Failure errorMessage;

 const PasswordUpdateFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
