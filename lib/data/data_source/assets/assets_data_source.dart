import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';

abstract class AssetsDataSource {
  Future<List<Category>> getCategories(CategoryType type);
  Future<List<Song>> getSongs(String category);
}
