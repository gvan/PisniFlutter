import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';

class GetSongsUseCase {
  final SongsRepository _songsRepository;

  GetSongsUseCase({required this._songsRepository});

  Future<List<SongModel>> call(String category) {
    return _songsRepository.getSongs(category);
  }
}
