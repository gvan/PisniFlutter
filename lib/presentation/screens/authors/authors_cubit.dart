import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/screens/authors/authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  final SongsRepository _songsRepository;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  AuthorsCubit({required this._songsRepository})
    : super(AuthorsState(authors: [], isLoading: true)) {
    _init();
  }

  void _init() async {
    _categoriesSubscription = _songsRepository.streamAuthorsWithSongs().listen((
      authors,
    ) {
      final authorsEntities = authors.toEntities();
      emit(
        state.copyWith(
          authors: authorsEntities,
          isLoading: authorsEntities.isEmpty,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _categoriesSubscription?.cancel();
    return super.close();
  }
}
