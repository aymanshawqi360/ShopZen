import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request_mode.g.dart';
@JsonSerializable()
class ResetPasswordRequestMode {
  final String? email;

  ResetPasswordRequestMode({required this.email});

  factory ResetPasswordRequestMode.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModeFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestModeToJson(this);
}
