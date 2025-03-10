import 'package:pisni/data/entity/category.dart';

abstract class ISongsRepository {
  Future<List<Category>> getCategories();
  Future<List<Category>> getAuthors();
}
