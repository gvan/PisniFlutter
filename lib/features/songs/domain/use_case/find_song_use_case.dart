import 'package:pisni/features/songs/data/models/song_model.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class FindSongUseCase {
  final SongsRepository _songsRepository;

  FindSongUseCase({required this._songsRepository});

  Future<List<SongModel>> call(String input) async {
    return await _songsRepository.searchSongs(input);
  }
}
