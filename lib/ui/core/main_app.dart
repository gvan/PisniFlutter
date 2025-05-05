import 'package:flutter/material.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';
import 'package:pisni/data/service/preferences/preferences_service.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';
import 'package:pisni/data/service/songs/songs_service.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/ui/screens/favorite/favorite_view_model.dart';
import 'package:pisni/ui/navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => SongsService() as ISongsService),
          Provider(
              create: (context) => PreferencesService() as IPreferencesService),
          Provider(
              create: (context) => SongsRepository(
                  songsService: context.read(),
                  preferencesService: context.read()) as ISongsRepository),
          Provider(
              create: (context) =>
                  SettignsRepository(preferencesService: context.read())
                      as ISettingsRepository),
          ChangeNotifierProvider(
              create: (context) =>
                  FavoriteViewModel(songsRepository: context.read()))
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(useMaterial3: true),
          home: BottomNavigation(),
        ));
  }
}
