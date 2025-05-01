import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/ui/favorite/favorite_state.dart';

class FavoriteViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  FavoriteState _state = FavoriteState(songs: []);

  FavoriteState get state => _state;

  FavoriteViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    reloadFavoriteSongs();
  }

  void reloadFavoriteSongs() async {
    final songs = await _songsRepository.getFavorites();
    _state = _state.copyWith(songs: songs);
    notifyListeners();
  }
}
