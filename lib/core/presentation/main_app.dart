import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/core/di/service_locator.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/core/presentation/theme_cubit.dart';
import 'package:pisni/core/presentation/navigation/bottom_navigation.dart';
import 'package:pisni/core/presentation/styles/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(settingsRepository: sl())),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode?>(
        builder: (context, themeMode) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            themeMode: themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: BottomNavigation(),
          );
        },
      ),
    );
  }
}
