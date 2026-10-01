import 'package:pisni/domain/repository/songs/songs_repository.dart';

class FavoriteSongUseCase {
  final SongsRepository _songsRepository;

  FavoriteSongUseCase({required this._songsRepository});

  Future<bool> call(int songId) async {
    return await _songsRepository.isFavoriteSong(songId);
  }
}
