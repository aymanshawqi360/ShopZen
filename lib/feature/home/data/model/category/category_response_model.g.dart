// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseModel _$CategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => CategoryResponseModel(
  status: (json['status'] as num?)?.toInt(),
  categoryData: (json['category'] as List<dynamic>?)
      ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryResponseModelToJson(
  CategoryResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'category': instance.categoryData,
};

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  name: json['name'] as String?,
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
