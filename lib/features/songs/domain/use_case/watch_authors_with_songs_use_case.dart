import 'package:pisni/features/songs/data/models/category_model.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class WatchAuthorsWithSongsUseCase {
  final SongsRepository _songsRepository;

  WatchAuthorsWithSongsUseCase({required this._songsRepository});

  Stream<List<CategoryModel>> call() {
    return _songsRepository.streamAuthorsWithSongs();
  }
}
