import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';

class WatchAuthorsWithSongsUseCase {
  final SongsRepository _songsRepository;

  WatchAuthorsWithSongsUseCase({required this._songsRepository});

  Stream<List<CategoryModel>> call() {
    return _songsRepository.streamAuthorsWithSongs();
  }
}
