import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/ui/songs/songs_state.dart';

class SongsViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  SongsState _state = SongsState(songs: []);

  SongsState get state => _state;

  SongsViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository;

  void loadSongs(String category) async {
    final songs = await _songsRepository.getSongs(category);
    _state = _state.copyWith(songs: songs);
    notifyListeners();
  }
}
