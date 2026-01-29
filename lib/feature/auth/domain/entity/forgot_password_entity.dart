import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final int? status;
  final String? message;
  

  const ForgotPasswordEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
    status,
    message,
  ];

  
}
