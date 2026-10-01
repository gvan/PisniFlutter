import 'package:get_it/get_it.dart';
import 'package:pisni/features/songs/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/features/songs/data/data_source/assets/assets_data_source_impl.dart';
import 'package:pisni/features/settings/data/data_source/preferences/preferences_data_source.dart';
import 'package:pisni/features/settings/data/data_source/preferences/preferences_data_source_impl.dart';
import 'package:pisni/features/songs/data/data_source/songs/songs_data_source.dart';
import 'package:pisni/features/songs/data/data_source/songs/songs_data_source_impl.dart';
import 'package:pisni/features/settings/domain/repository/settings_repository.dart';
import 'package:pisni/features/settings/data/repository/settings_repository_impl.dart';
import 'package:pisni/features/songs/domain/repository/songs_repository.dart';
import 'package:pisni/features/songs/data/repository/songs_repository_impl.dart';
import 'package:pisni/features/settings/domain/use_case/get_settings_use_case.dart';
import 'package:pisni/features/settings/domain/use_case/save_settings_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/favorite_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/find_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/get_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/toggle_favorite_song_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_authors_with_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_categories_with_songs_use_case.dart';
import 'package:pisni/features/songs/domain/use_case/watch_favorite_songs_use_case.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<AssetsDataSource>(() => AssetsDataSourceImpl());

    sl.registerLazySingleton<SongsDataSource>(() => SongsDataSourceImpl());

    sl.registerLazySingleton<PreferencesDataSource>(
      () => PreferencesDataSourceImpl(),
    );

    sl.registerLazySingleton<SongsRepository>(
      () => SongsRepositoryImpl(songsService: sl(), assetsService: sl()),
    );

    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(preferencesService: sl()),
    );

    sl.registerLazySingleton<FavoriteSongUseCase>(
      () => FavoriteSongUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<ToggleFavoriteSongUseCase>(
      () => ToggleFavoriteSongUseCase(songsRepository: sl()),
    );

    sl.registerLazySingleton<GetSettingsUseCase>(
      () => GetSettingsUseCase(settingsRepository: sl()),
    );

    sl.registerLazySingleton<SaveSettingsUseCase>(
      () => SaveSettingsUseCase(settingsRepository: sl()),
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
