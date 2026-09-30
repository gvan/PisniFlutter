import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/favorite/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ISongsRepository _songsRepository;
  StreamSubscription<List<SongModel>>? _favoriteSubscription;

  FavoriteCubit({required this._songsRepository})
    : super(FavoriteState(songs: [], isLoading: true)) {
    _init();
  }

  void _init() async {
    _subscribeFavoriteSongs();
  }

  @override
  Future<void> close() {
    _favoriteSubscription?.cancel();
    return super.close();
  }

  void _subscribeFavoriteSongs() async {
    _favoriteSubscription = _songsRepository.streamFavoriteSongs().listen((
      songs,
    ) {
      emit(state.copyWith(songs: songs.toEntities(), isLoading: false));
    });
  }
}
