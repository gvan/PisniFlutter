import 'package:get_it/get_it.dart';
import 'package:pisni/features/songs/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/features/songs/data/data_source/assets/assets_data_source_impl.dart';
import 'package:pisni/features/songs/data/data_source/songs/songs_data_source.dart';
import 'package:pisni/features/songs/data/data_source/songs/songs_data_source_impl.dart';
import 'package:pisni/features/songs/data/repository/songs_repository_impl.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';
import 'package:pisni/features/songs/domain/use_case/favorite_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/find_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/get_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/toggle_favorite_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_authors_with_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_categories_with_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_favorite_songs_use_case.dart';

class SongsServiceLocator {
  final GetIt sl;

  SongsServiceLocator({required this.sl});

  void init() {
    sl.registerLazySingleton<AssetsDataSource>(() => AssetsDataSourceImpl());

    sl.registerLazySingleton<SongsDataSource>(() => SongsDataSourceImpl());

    sl.registerLazySingleton<SongsRepository>(
      () => SongsRepositoryImpl(songsService: sl(), assetsService: sl()),
    );

    sl.registerLazySingleton<FavoriteSongUseCase>(
      () => FavoriteSongUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<ToggleFavoriteSongUseCase>(
      () => ToggleFavoriteSongUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<GetSongsUseCase>(
      () => GetSongsUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<FindSongUseCase>(
      () => FindSongUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<WatchCategoriesWithSongsUseCase>(
      () => WatchCategoriesWithSongsUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<WatchAuthorsWithSongsUseCase>(
      () => WatchAuthorsWithSongsUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<WatchFavoriteSongsUseCase>(
      () => WatchFavoriteSongsUseCase(songsRepository: sl()),
    );
  }
}
