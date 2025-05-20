import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/screens/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  HomeState _state = HomeState(categories: [], isLoading: true);

  HomeState get state => _state;

  HomeViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    _categoriesSubscription =
        _songsRepository.streamCategoriesWithSongs().listen((categories) {
      final categoryEntities = categories.toEntities();
      _state = _state.copyWith(
          categories: categoryEntities, isLoading: categoryEntities.isEmpty);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _categoriesSubscription?.cancel();
    super.dispose();
  }
}
