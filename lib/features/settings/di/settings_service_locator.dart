import 'package:get_it/get_it.dart';
import 'package:pisni/features/settings/data/data_source/preferences/preferences_data_source.dart';
import 'package:pisni/features/settings/data/data_source/preferences/preferences_data_source_impl.dart';
import 'package:pisni/features/settings/data/repository/settings_repository_impl.dart';
import 'package:pisni/features/settings/domain/repository/settings_repository.dart';
import 'package:pisni/features/settings/domain/use_case/get_settings_use_case.dart';
import 'package:pisni/features/settings/domain/use_case/save_settings_use_case.dart';

class SettingsServiceLocator {
  final GetIt sl;

  SettingsServiceLocator({required this.sl});

  void init() {
    sl.registerLazySingleton<PreferencesDataSource>(
      () => PreferencesDataSourceImpl(),
    );

    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(preferencesService: sl()),
    );

    sl.registerLazySingleton<GetSettingsUseCase>(
      () => GetSettingsUseCase(settingsRepository: sl()),
    );

    sl.registerLazySingleton<SaveSettingsUseCase>(
      () => SaveSettingsUseCase(settingsRepository: sl()),
    );
  }
}
