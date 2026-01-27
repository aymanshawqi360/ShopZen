// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) =>
    UserData(token: json['access_token'] as String?);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'access_token': instance.token,
};
