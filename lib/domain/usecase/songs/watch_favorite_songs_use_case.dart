import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';

class WatchFavoriteSongsUseCase {
  final SongsRepository _songsRepository;

  WatchFavoriteSongsUseCase({required this._songsRepository});

  Stream<List<SongModel>> call() {
    return _songsRepository.streamFavoriteSongs();
  }
}
