// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      text: json['text'] as String,
      audio_file_name: json['audio_file_name'] as String?,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'audio_file_name': instance.audio_file_name,
    };
