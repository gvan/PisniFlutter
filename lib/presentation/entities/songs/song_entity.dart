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
