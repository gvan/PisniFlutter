import 'package:get_it/get_it.dart';
import 'package:pisni/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/data/data_source/assets/assets_data_source_impl.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source_impl.dart';
import 'package:pisni/data/data_source/songs/songs_data_source.dart';
import 'package:pisni/data/data_source/songs/songs_data_source_impl.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<AssetsDataSource>(() => AssetsDataSourceImpl());

    sl.registerLazySingleton<SongsDataSource>(() => SongsDataSourceImpl());

    sl.registerLazySingleton<PreferencesDataSource>(
      () => PreferencesDataSourceImpl(),
    );

    sl.registerLazySingleton<ISongsRepository>(
      () => SongsRepository(songsService: sl(), assetsService: sl()),
    );

    sl.registerLazySingleton<ISettingsRepository>(
      () => SettignsRepository(preferencesService: sl()),
    );
  }
}
