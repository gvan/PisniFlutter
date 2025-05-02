import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  final int id;
  final String title;
  final String text;
  final String? author;
  final String? audio_file_name;

  Song(
      {required this.id,
      required this.title,
      required this.text,
      required this.author,
      required this.audio_file_name});

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
