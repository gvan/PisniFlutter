import 'package:flutter/material.dart';
import 'package:pisni/data/repository/settings/i_settings_repository.dart';
import 'package:pisni/data/repository/settings/settings_repository.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/data/repository/songs/songs_repository.dart';
import 'package:pisni/data/data_source/assets/assets_data_source_impl.dart';
import 'package:pisni/data/data_source/assets/assets_data_source.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source_impl.dart';
import 'package:pisni/data/data_source/preferences/preferences_data_source.dart';
import 'package:pisni/data/data_source/songs/songs_data_source.dart';
import 'package:pisni/data/data_source/songs/songs_data_source_impl.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/presentation/core/theme_view_model.dart';
import 'package:pisni/presentation/navigation/bottom_navigation.dart';
import 'package:pisni/presentation/styles/themes.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SongsDataSourceImpl() as SongsDataSource),
        Provider(
            create: (context) => PreferencesDataSourceImpl() as PreferencesDataSource),
        Provider(create: (context) => AssetsDataSourceImpl() as AssetsDataSource),
        Provider(
            create: (context) => SongsRepository(
                  songsService: context.read(),
                  assetsService: context.read(),
                ) as ISongsRepository),
        Provider(
            create: (context) =>
                SettignsRepository(preferencesService: context.read())
                    as ISettingsRepository),
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
