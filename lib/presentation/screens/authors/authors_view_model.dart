import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/screens/authors/authors_state.dart';

class AuthorsViewModel extends ChangeNotifier {
  final ISongsRepository _songsRepository;
  AuthorsState _state = AuthorsState(authors: [], isLoading: true);
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  AuthorsState get state => _state;

  AuthorsViewModel({required ISongsRepository songsRepository})
      : _songsRepository = songsRepository {
    _init();
  }

  void _init() async {
    _categoriesSubscription =
        _songsRepository.streamAuthorsWithSongs().listen((authors) {
      final authorsEntities = authors.toEntities();
      _state = _state.copyWith(
          authors: authorsEntities, isLoading: authorsEntities.isEmpty);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _categoriesSubscription?.cancel();
    super.dispose();
  }
}
