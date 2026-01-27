import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final int? status;
  final String? message;
  final String ?userData;

  const AuthResponseEntity({
    required this.status,
    required this.message, this.userData,
  });

  @override
  List<Object?> get props => [
    status,
    message,
    userData
  ];

  isRight() {}
}
