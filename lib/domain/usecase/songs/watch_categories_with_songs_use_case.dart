import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';

class WatchCategoriesWithSongsUseCase {
  final SongsRepository _songsRepository;

  WatchCategoriesWithSongsUseCase({required this._songsRepository});

  Stream<List<CategoryModel>> call() {
    return _songsRepository.streamCategoriesWithSongs();
  }
}
