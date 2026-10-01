import 'package:pisni/features/songs/data/models/category_model.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class WatchCategoriesWithSongsUseCase {
  final SongsRepository _songsRepository;

  WatchCategoriesWithSongsUseCase({required this._songsRepository});

  Stream<List<CategoryModel>> call() {
    return _songsRepository.streamCategoriesWithSongs();
  }
}
