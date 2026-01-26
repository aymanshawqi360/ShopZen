import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final int? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData userData;

  RegisterResponseModel({required this.status, required this.message,required this.userData, });
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

@JsonSerializable()
class UserData{
  @JsonKey(name: 'access_token')
  final String? token;
  
  UserData({required this.token,});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
