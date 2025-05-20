import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.g.dart';
part 'song_model.freezed.dart';

@freezed
@JsonSerializable()
class SongModel with _$SongModel {
  @override
  final int id;
  @override
  final String title;
  @override
  final String text;
  @override
  final String? author;
  @override
  @JsonKey(name: 'audio_file_name')
  final String? audioFileName;
  @override
  final String? category;

  SongModel(
      {required this.id,
      required this.title,
      required this.text,
      required this.author,
      required this.audioFileName,
      this.category});

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}
