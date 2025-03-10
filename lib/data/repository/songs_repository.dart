import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/data/service/i_songs_service.dart';

class SongsRepository implements ISongsRepository {
  SongsRepository({required ISongsService songsService})
      : _songsService = songsService;

  final ISongsService _songsService;

  @override
  Future<List<Category>> getCategories() async {
    return _songsService.getCategories();
  }

  @override
  Future<List<Category>> getAuthors() {
    return _songsService.getAuthors();
  }
}
