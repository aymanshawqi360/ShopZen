import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
    final int? status;
  final String? message;
  final String ?userData;

  const RegisterResponseEntity({
    required this.status,
    required this.message, this.userData,
  });

  @override
  List<Object?> get props => [
    status,
    message,
    userData
  ];
}
