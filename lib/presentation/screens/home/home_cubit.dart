import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/songs/category_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/screens/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ISongsRepository _songsRepository;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  HomeCubit({required this._songsRepository})
    : super(HomeState(categories: [], isLoading: true)) {
    _init();
  }

  void _init() async {
    _categoriesSubscription = _songsRepository
        .streamCategoriesWithSongs()
        .listen((categories) {
          final categoryEntities = categories.toEntities();
          emit(
            state.copyWith(
              categories: categoryEntities,
              isLoading: categoryEntities.isEmpty,
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
