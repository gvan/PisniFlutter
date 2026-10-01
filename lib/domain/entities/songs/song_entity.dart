import 'package:pisni/data/models/songs/song_model.dart';

class SongEntity {
  final int id;
  final String title;
  final String text;
  final String? author;
  final String? audioFileName;
  final String? category;

  SongEntity(
      {required this.id,
      required this.title,
      required this.text,
      required this.author,
      required this.audioFileName,
      required this.category});
}

extension SongModelX on SongModel {
  SongEntity toEntity() => SongEntity(
      id: id,
      title: title,
      text: text,
      author: author,
      audioFileName: audioFileName,
      category: category);
}

extension SongModelListX on List<SongModel> {
  List<SongEntity> toEntities() => map((e) => e.toEntity()).toList();
}
