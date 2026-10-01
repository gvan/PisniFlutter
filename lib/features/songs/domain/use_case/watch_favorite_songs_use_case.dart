import 'package:pisni/features/songs/data/models/song_model.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class WatchFavoriteSongsUseCase {
  final SongsRepository _songsRepository;

  WatchFavoriteSongsUseCase({required this._songsRepository});

  Stream<List<SongModel>> call() {
    return _songsRepository.streamFavoriteSongs();
  }
}
