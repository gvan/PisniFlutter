import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:pisni/data/db/database.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';

class SongsService implements ISongsService {
  final database = AppDatabase();

  @override
  Future<List<Category>> getCategories(CategoryType type) async {
    return (await (database.select(database.categoryTable)
              ..where((table) => table.type.equals(type.type)))
            .get())
        .map(
          (e) => Category(
            id: e.id,
            title: e.title,
            type: CategoryType.fromValue(e.type),
          ),
        )
        .toList();
  }

  @override
  Future<List<Category>> getCategoriesAssets(CategoryType type) async {
    final fileName = type == CategoryType.category
        ? 'assets/home.json'
        : 'assets/authors.json';
    final data = await rootBundle.loadString(fileName);
    final json = jsonDecode(data);
    return List<Category>.from(
      json.map(
        (x) => Category.fromJson(x).copyWith(type: type),
      ),
    );
  }

  @override
  Future<void> saveCategories(List<Category> categories) async {
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
  Future<List<Song>> getSongs(String category) async {
    final songs = await (database.select(database.songTable)
          ..where((table) => table.category.equals(category)))
        .get();
    return songs
        .map((e) => Song(
              id: e.id,
              title: e.title,
              text: e.songText,
              author: e.author,
              audio_file_name: e.audioFileName,
            ))
        .toList();
  }

  @override
  Future<List<Song>> searchSongs(String query) async {
    final songs = await (database.select(database.songTable)
          ..where((e) => e.titleLower.contains(query.toLowerCase())))
        .get();
    return songs
        .map((e) => Song(
            id: e.id,
            title: e.title,
            text: e.songText,
            author: e.author,
            audio_file_name: e.audioFileName))
        .toList();
  }

  @override
  Future<List<Song>> getSongsAssets(String category) async {
    final data = await rootBundle.loadString('assets/songs/$category.json');
    final json = jsonDecode(data);
    return List<Song>.from(
      json.map(
        (x) => Song.fromJson(x).copyWith(category: category),
      ),
    );
  }

  @override
  Future<void> saveSongs(List<Song> songs) async {
    await database.batch((batch) {
      batch.insertAll(
        database.songTable,
        songs.map(
          (e) => SongTableCompanion.insert(
            id: e.id,
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
}
