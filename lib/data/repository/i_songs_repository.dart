import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';

abstract class ISongsRepository {
  Future<List<Category>> getCategories();
  Future<List<Category>> getAuthors();
  Future<List<Song>> getSongs(String category);
}
