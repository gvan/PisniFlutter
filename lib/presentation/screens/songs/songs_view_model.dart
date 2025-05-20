import 'package:flutter/material.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/songs/songs_state.dart';

class SongsViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  SongsState _state = SongsState(songs: [], isLoading: false);

  SongsState get state => _state;

  SongsViewModel(
      {required ISongsRepository songsRepository, required CategoryEntity category})
      : _songsRepository = songsRepository {
    loadSongs(category.id);
  }

  void loadSongs(String category) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final songs = await _songsRepository.getSongs(category);
    _state = _state.copyWith(songs: songs.toEntities());
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
