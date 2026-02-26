import 'package:json_annotation/json_annotation.dart';
part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final int? status;
  @JsonKey(name: 'category')
  final List<CategoryData>? categoryData;

  CategoryResponseModel({required this.status, required this.categoryData});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}

@JsonSerializable()
class CategoryData {
  final String? name;
  final int? id;
  final String? image;

  CategoryData({required this.name, required this.id, required this.image});
  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
