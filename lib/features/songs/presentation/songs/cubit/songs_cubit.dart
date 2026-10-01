import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/features/songs/domain/entities/category_entity.dart';
import 'package:pisni/features/songs/domain/entities/song_entity.dart';
import 'package:pisni/features/songs/domain/use_case/get_songs_use_case.dart';
import 'package:pisni/features/songs/presentation/songs/cubit/songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  final GetSongsUseCase _getSongsUseCase;

  SongsCubit({required this._getSongsUseCase, required CategoryEntity category})
    : super(SongsState(songs: [], isLoading: false)) {
    loadSongs(category.id);
  }

  void loadSongs(String category) async {
    emit(state.copyWith(isLoading: true));
    final songs = await _getSongsUseCase(category);
    emit(state.copyWith(songs: songs.toEntities(), isLoading: false));
  }
}
