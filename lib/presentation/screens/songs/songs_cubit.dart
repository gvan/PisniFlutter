import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/songs/songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  final SongsRepository _songsRepository;

  SongsCubit({
    required this._songsRepository,
    required CategoryEntity category,
  }) : super(SongsState(songs: [], isLoading: false)) {
    loadSongs(category.id);
  }

  void loadSongs(String category) async {
    emit(state.copyWith(isLoading: true));
    final songs = await _songsRepository.getSongs(category);
    emit(state.copyWith(songs: songs.toEntities(), isLoading: false));
  }
}
