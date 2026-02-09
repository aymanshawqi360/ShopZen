import 'package:json_annotation/json_annotation.dart';
part 'password_update_request_model.g.dart';
@JsonSerializable()
class PasswordUpdateRequestModel {
  final String? email;
  @JsonKey(name: 'password')
  final String? oldPassword;
  @JsonKey(name: 'password_confirmation')
  final String? newPassword;

  PasswordUpdateRequestModel({
    required this.email,
    required this.oldPassword,
    required this.newPassword,
  });

  factory PasswordUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordUpdateRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordUpdateRequestModelToJson(this);
}
