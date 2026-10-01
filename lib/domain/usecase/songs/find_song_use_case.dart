import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';

class FindSongUseCase {
  final SongsRepository _songsRepository;

  FindSongUseCase({required this._songsRepository});

  Future<List<SongModel>> call(String input) async {
    return await _songsRepository.searchSongs(input);
  }
}
