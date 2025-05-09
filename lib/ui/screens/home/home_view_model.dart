import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/ui/screens/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  StreamSubscription<List<Category>>? _categoriesSubscription;

  HomeState _state = HomeState(categories: [], isLoading: true);

  HomeState get state => _state;

  HomeViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    _categoriesSubscription =
        _songsRepository.streamCategoriesWithSongs().listen((categories) {
      _state = _state.copyWith(categories: categories, isLoading: categories.isEmpty);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _categoriesSubscription?.cancel();
    super.dispose();
  }
}
