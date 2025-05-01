import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/ui/search/search_state.dart';

class SearchViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  SearchState _state = SearchState(songs: []);

  SearchState get state => _state;

  SearchViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository;

  void search(String input) async {
    final songs = await _songsRepository.search(input);
    print('APPLOG ${songs.length}');
    _state = _state.copyWith(songs: songs);
    notifyListeners();
  }
}
