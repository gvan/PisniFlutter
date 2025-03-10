import 'package:pisni/data/entity/category.dart';

abstract class ISongsService {
  Future<List<Category>> getCategories();
  Future<List<Category>> getAuthors();
}
