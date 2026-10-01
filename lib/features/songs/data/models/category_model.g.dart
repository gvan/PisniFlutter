// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      songs: (json['songs'] as List<dynamic>?)
              ?.map((e) => SongModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: $enumDecodeNullable(_$CategoryTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'songs': instance.songs,
      'type': _$CategoryTypeEnumMap[instance.type],
    };

const _$CategoryTypeEnumMap = {
  CategoryType.category: 'category',
  CategoryType.author: 'author',
};
