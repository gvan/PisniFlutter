import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';

class CategoryEntity {
  final String id;
  final String title;
  final List<SongEntity> songs;

  CategoryEntity({required this.id, required this.title, required this.songs});
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() =>
      CategoryEntity(id: id, title: title, songs: songs.toEntities());
}

extension CategoryModelListX on List<CategoryModel> {
  List<CategoryEntity> toEntities() => map((e) => e.toEntity()).toList();
}
