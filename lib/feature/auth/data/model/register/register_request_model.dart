import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';
@JsonSerializable()
class RegisterRequestModel {
  @JsonKey(name: 'first_name')
  final String ?firstName;
  @JsonKey(name: 'last_name')
  final String ?lastName;
  final String ?phone;
  final String ?email;
  final String ?password;
  @JsonKey(name: 'password_confirmation')
  final String? confirmPassword;
  @JsonKey(name: 'country_code')
  final String countryCode;

  RegisterRequestModel({required this.firstName, required this.lastName, required this.phone, required this.email, required this.password, required this.confirmPassword, required this.countryCode});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);

}