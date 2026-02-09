// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordUpdateRequestModel _$PasswordUpdateRequestModelFromJson(
  Map<String, dynamic> json,
) => PasswordUpdateRequestModel(
  email: json['email'] as String?,
  oldPassword: json['password'] as String?,
  newPassword: json['password_confirmation'] as String?,
);

Map<String, dynamic> _$PasswordUpdateRequestModelToJson(
  PasswordUpdateRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.oldPassword,
  'password_confirmation': instance.newPassword,
};
