import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/ui/song/song_state.dart';

class SongViewModel extends ChangeNotifier {
  final ISongsRepository songsRepository;

  SongState _state = SongState(
      song: Song(id: 0, title: '', text: '', audio_file_name: ''),
      isFavorite: false);

  SongViewModel({required this.songsRepository});

  SongState get state => _state;

  void setSong(Song song) async {
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
    _state = _state.copyWith(song: song, isFavorite: isFavorite);
    notifyListeners();
  }

  Future<void> addToFavorite(Song song) async {
    await songsRepository.toggleFavorite(song.id);
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
    _state = _state.copyWith(isFavorite: isFavorite);
    notifyListeners();
  }
}
