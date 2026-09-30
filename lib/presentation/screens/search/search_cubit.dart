import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ISongsRepository _songsRepository;

  SearchCubit({required this._songsRepository}) : super(SearchState(songs: []));

  void search(String input) async {
    final songs = await _songsRepository.searchSongs(input);
    emit(state.copyWith(songs: songs.toEntities()));
  }
}
