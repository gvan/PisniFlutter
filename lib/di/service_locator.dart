import 'package:get_it/get_it.dart';
import 'package:pisni/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/data/data_source/assets/assets_data_source_impl.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source_impl.dart';
import 'package:pisni/data/data_source/songs/songs_data_source.dart';
import 'package:pisni/data/data_source/songs/songs_data_source_impl.dart';
import 'package:pisni/domain/repository/settings/settings_repository.dart';
import 'package:pisni/data/repository/settings/settings_repository_impl.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';
import 'package:pisni/data/repository/songs/songs_repository_impl.dart';
import 'package:pisni/domain/usecase/settings/get_settings_use_case.dart';
import 'package:pisni/domain/usecase/settings/save_settings_use_case.dart';
import 'package:pisni/domain/usecase/songs/favorite_song_use_case.dart';
import 'package:pisni/domain/usecase/songs/find_song_use_case.dart';
import 'package:pisni/domain/usecase/songs/toggle_favorite_song_use_case.dart';
import 'package:pisni/domain/usecase/songs/watch_authors_with_songs_use_case.dart';
import 'package:pisni/domain/usecase/songs/watch_categories_with_songs_use_case.dart';
import 'package:pisni/domain/usecase/songs/watch_favorite_songs_use_case.dart';

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
