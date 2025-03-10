import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/ui/authors/authors_state.dart';

class AuthorsViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  AuthorsState _state = AuthorsState(authors: []);

  AuthorsState get state => _state;

  AuthorsViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    final authors = await _songsRepository.getAuthors();
    _state = _state.copyWith(authors: authors);
    notifyListeners();
  }
}
