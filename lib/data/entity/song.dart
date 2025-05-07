import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.g.dart';
part 'song.freezed.dart';

@freezed
@JsonSerializable()
class Song with _$Song {
  @override
  final int id;
  @override
  final String title;
  @override
  final String text;
  @override
  final String? author;
  @override
  final String? audio_file_name;
  @override
  final String? category;

  Song(
      {required this.id,
      required this.title,
      required this.text,
      required this.author,
      required this.audio_file_name,
      this.category});

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
