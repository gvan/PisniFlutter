// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) => SongModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      text: json['text'] as String,
      author: json['author'] as String?,
      audio_file_name: json['audio_file_name'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'author': instance.author,
      'audio_file_name': instance.audio_file_name,
      'category': instance.category,
    };
