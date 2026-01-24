// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.userData,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) =>
    UserData(token: json['access_token'] as String?);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'access_token': instance.token,
};
