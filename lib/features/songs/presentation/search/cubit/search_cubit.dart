import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/features/songs/domain/entities/song_entity.dart';
import 'package:pisni/features/songs/domain/use_case/find_song_use_case.dart';
import 'package:pisni/features/songs/presentation/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final FindSongUseCase _findSongUseCase;

  SearchCubit({required this._findSongUseCase}) : super(SearchState(songs: []));

  void search(String input) async {
    final songs = await _findSongUseCase(input);
    emit(state.copyWith(songs: songs.toEntities()));
  }
}
