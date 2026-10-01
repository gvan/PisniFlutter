import 'package:pisni/features/songs/data/models/song_model.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class GetSongsUseCase {
  final SongsRepository _songsRepository;

  GetSongsUseCase({required this._songsRepository});

  Future<List<SongModel>> call(String category) {
    return _songsRepository.getSongs(category);
  }
}
