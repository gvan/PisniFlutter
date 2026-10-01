import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/features/songs/data/models/category_model.dart';
import 'package:pisni/features/songs/domain/entities/category_entity.dart';
import 'package:pisni/features/songs/domain/use_case/watch_categories_with_songs_use_case.dart';
import 'package:pisni/features/songs/presentation/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WatchCategoriesWithSongsUseCase _watchCategoriesWithSongsUseCase;

  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  HomeCubit({required this._watchCategoriesWithSongsUseCase})
    : super(HomeState(categories: [], isLoading: true)) {
    _init();
  }

  void _init() async {
    _categoriesSubscription = _watchCategoriesWithSongsUseCase().listen((
      categories,
    ) {
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
