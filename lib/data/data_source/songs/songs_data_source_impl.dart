import 'package:drift/drift.dart';
import 'package:pisni/data/db/database.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/models/songs/category_type.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/data/data_source/songs/songs_data_source.dart';

class SongsDataSourceImpl implements SongsDataSource {
  final database = AppDatabase();

  @override
  Future<List<CategoryModel>> getCategories(CategoryType type) async {
    return await (database.select(database.categoryTable)
          ..where((table) => table.type.equals(type.type)))
        .map(
          (e) => CategoryModel(
            id: e.id,
            title: e.title,
            type: CategoryType.fromValue(e.type),
          ),
        )
        .get();
  }

  @override
  Stream<List<CategoryModel>> streamCategories(CategoryType type) {
    return (database.select(database.categoryTable)
          ..where((table) => table.type.equals(type.type)))
        .map(
          (e) => CategoryModel(
            id: e.id,
            title: e.title,
            type: CategoryType.fromValue(e.type),
          ),
        )
        .watch();
  }

  @override
  Future<void> saveCategories(List<CategoryModel> categories) async {
    await database.batch((batch) {
      batch.insertAll(
        database.categoryTable,
        categories.map(
          (e) => CategoryTableCompanion.insert(
            id: e.id,
            title: e.title,
            type: e.type?.type ?? CategoryType.category.type,
          ),
        ),
      );
    });
  }

  @override
  Future<List<SongModel>> getSongs({
    String? category,
    List<int>? filterIds,
    int? limit,
  }) async {
    final songsQuery = database.select(database.songTable);
    if (category != null) {
      songsQuery.where((e) => e.category.equals(category));
    }
    if (filterIds != null) {
      songsQuery.where((e) => e.id.isIn(filterIds));
    }
    if (limit != null) {
      songsQuery.limit(limit);
    }
    final songs = await songsQuery.get();
    return songs
        .map((e) => SongModel(
              id: e.id,
              title: e.title,
              text: e.songText,
              author: e.author,
              audio_file_name: e.audioFileName,
            ))
        .toList();
  }

  @override
  Future<List<SongModel>> searchSongs(String query) async {
    final songs = await (database.select(database.songTable)
          ..where((e) => e.titleLower.contains(query.toLowerCase())))
        .get();
    return songs
        .map((e) => SongModel(
            id: e.id,
            title: e.title,
            text: e.songText,
            author: e.author,
            audio_file_name: e.audioFileName))
        .toList();
  }

  @override
  Future<void> saveSongs(List<SongModel> songs) async {
    await database.batch((batch) {
      batch.insertAll(
        database.songTable,
        songs.map(
          (e) => SongTableCompanion.insert(
            id: Value(e.id),
            category: e.category ?? '',
            title: e.title,
            titleLower: e.title.toLowerCase(),
            songText: e.text,
            songTextLower: e.text.toLowerCase(),
            author: Value.absentIfNull(e.author),
            audioFileName: Value.absentIfNull(e.audio_file_name),
          ),
        ),
      );
    });
  }

  @override
  Future<void> addFavorite(int id) async {
    await database
        .into(database.favoriteTable)
        .insert(FavoriteTableCompanion.insert(id: Value(id)));
  }

  @override
  Future<List<int>> getFavorites() async {
    return await database.select(database.favoriteTable).map((e) => e.id).get();
  }

  @override
  Stream<List<int>> streamFavorites() {
    return database.select(database.favoriteTable).map((e) => e.id).watch();
  }

  @override
  Future<void> removeFavorite(int id) async {
    await (database.delete(database.favoriteTable)
          ..where((e) => e.id.equals(id)))
        .go();
  }
}
