import 'package:flutter/foundation.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/ui/screens/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;

  HomeState _state = HomeState(categories: []);

  HomeState get state => _state;

  HomeViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    final categories = await _songsRepository.getCategories();
    _state = _state.copyWith(categories: categories);
    notifyListeners();
  }
}
