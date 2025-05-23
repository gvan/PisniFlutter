import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/favorite/favorite_state.dart';

class FavoriteViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  FavoriteState _state = FavoriteState(songs: [], isLoading: true);
  StreamSubscription<List<SongModel>>? _favoriteSubscription;

  FavoriteState get state => _state;

  FavoriteViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    _subscribeFavoriteSongs();
  }

  @override
  void dispose() {
    _favoriteSubscription?.cancel();
    super.dispose();
  }

  void _subscribeFavoriteSongs() async {
    _favoriteSubscription =
        _songsRepository.streamFavoriteSongs().listen((songs) {
      _state = _state.copyWith(songs: songs.toEntities(), isLoading: false);
      notifyListeners();
    });
  }
}
