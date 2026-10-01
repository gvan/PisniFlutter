import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/domain/entities/songs/category_entity.dart';
import 'package:pisni/domain/usecase/songs/watch_authors_with_songs_use_case.dart';
import 'package:pisni/presentation/screens/authors/cubit/authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  final WatchAuthorsWithSongsUseCase _watchAuthorsWithSongsUseCase;

  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  AuthorsCubit({required this._watchAuthorsWithSongsUseCase})
    : super(AuthorsState(authors: [], isLoading: true)) {
    _init();
  }

  void _init() async {
    _categoriesSubscription = _watchAuthorsWithSongsUseCase().listen((authors) {
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
