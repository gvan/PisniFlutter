import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/di/service_locator.dart';
import 'package:pisni/domain/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/favorite/favorite_screen.dart';
import 'package:pisni/presentation/screens/favorite/favorite_cubit.dart';
import 'package:pisni/presentation/screens/other/other_screen.dart';
import 'package:pisni/presentation/screens/settings/settings_screen.dart';
import 'package:pisni/presentation/screens/settings/settings_cubit.dart';
import 'package:pisni/presentation/screens/song/song_screen.dart';
import 'package:pisni/presentation/screens/song/song_cubit.dart';

class OtherNavigation extends StatefulWidget {
  final Key navigatorKey;

  const OtherNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() {
    return _OtherNavigationState();
  }
}

class _OtherNavigationState extends State<OtherNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case '/':
                return OtherScreen();
              case '/favorite':
                return BlocProvider(
                  create: (context) => FavoriteCubit(songsRepository: sl()),
                  child: FavoriteScreen(),
                );
              case '/song':
                final song = settings.arguments as SongEntity;
                return BlocProvider(
                  create: (context) => SongCubit(
                    favoriteSongUseCase: sl(),
                    toggleFavoriteSongUseCase: sl(),
                  ),
                  child: SongScreen(song: song),
                );
              case '/settings':
                return BlocProvider(
                  create: (context) => SettingsCubit(settingsRepository: sl()),
                  child: SettingsScreen(),
                );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
