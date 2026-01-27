import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final int? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData userData;

  AuthResponseModel({required this.status, required this.message,required this.userData, });
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable()
class UserData{
  @JsonKey(name: 'access_token')
  final String? token;
  
  UserData({required this.token,});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
