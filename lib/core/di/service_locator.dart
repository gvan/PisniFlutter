import 'package:get_it/get_it.dart';
import 'package:pisni/features/settings/di/settings_service_locator.dart';
import 'package:pisni/features/songs/di/songs_service_locator.dart';

final GetIt sl = GetIt.instance;

  void initServiceLocator() {
    SettingsServiceLocator(sl: sl).init();
    SongsServiceLocator(sl: sl).init();
  }
