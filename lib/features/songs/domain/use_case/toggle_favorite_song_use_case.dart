import 'package:pisni/features/songs/domain/repository/songs_repository.dart';

class ToggleFavoriteSongUseCase {
  final SongsRepository _songsRepository;

  ToggleFavoriteSongUseCase({required this._songsRepository});

  Future<void> call(int songId) async {
    await _songsRepository.toggleFavorite(songId);
  }
}
