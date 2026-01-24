
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class Failure {
  final int? errorCode;
  final String? errorMessage;
  @JsonKey(name: 'errors')
  final Map<String,dynamic>? errorData;
  Failure({this.errorCode, this.errorData, this.errorMessage});

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);

  String allError(){
    if(errorData == null || errorData!.isEmpty) return "Unknown error occurred";

        StringBuffer message = StringBuffer();
        errorData!.forEach((key, value) {
          if(value is List){
            for (var element in value) {
              message.write("- $element\n");
            }
            return;
          }else{
            message.write("- $value\n");
            return;
          }
        });
    
      
    return message.toString();
  }
}