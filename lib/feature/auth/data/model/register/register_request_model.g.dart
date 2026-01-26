// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterRequestModel(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  confirmPassword: json['password_confirmation'] as String?,
  countryCode: json['country_code'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  RegisterRequestModel instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.confirmPassword,
  'country_code': instance.countryCode,
};
