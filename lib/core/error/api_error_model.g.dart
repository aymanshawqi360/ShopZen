// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
  errorCode: (json['status'] as num?)?.toInt(),
  errorData: json['errors'] as Map<String, dynamic>?,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
  'status': instance.errorCode,
  'errorMessage': instance.errorMessage,
  'errors': instance.errorData,
};
