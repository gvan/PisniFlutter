import 'package:pisni/presentation/entities/songs/song_entity.dart';

class CategoryEntity {
  final String id;
  final String title;
  final List<SongEntity> songs;

  CategoryEntity({required this.id, required this.title, required this.songs});

}