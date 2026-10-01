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
  }
}
