import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';
import 'package:pisni/data/service/preferences/preferences_service.dart';
import 'package:pisni/data/service/preferences/i_preferences_service.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';
import 'package:pisni/data/service/songs/songs_service.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/ui/core/theme_view_model.dart';
import 'package:pisni/ui/screens/favorite/favorite_view_model.dart';
import 'package:pisni/ui/navigation/bottom_navigation.dart';
import 'package:pisni/ui/styles/themes.dart';
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
                FavoriteViewModel(songsRepository: context.read())),
        ChangeNotifierProvider(
            create: (context) =>
                ThemeViewModel(settingsRepository: context.read()))
      ],
      child: Builder(builder: (context) {
        final themeMode =
            context.select((ThemeViewModel viewModel) => viewModel.themeMode);

        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: BottomNavigation(),
        );
      }),
    );
  }
}
