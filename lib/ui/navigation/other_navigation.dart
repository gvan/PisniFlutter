import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/favorite/favorite_screen.dart';
import 'package:pisni/ui/other/other_screen.dart';
import 'package:pisni/ui/settings/settings_screen.dart';
import 'package:pisni/ui/settings/settings_view_model.dart';
import 'package:pisni/ui/song/song_screen.dart';
import 'package:pisni/ui/song/song_view_model.dart';
import 'package:provider/provider.dart';

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
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return OtherScreen();
            case '/favorite':
              return FavoriteScreen();
            case '/song':
              final song = settings.arguments as Song;
              return ChangeNotifierProvider(
                create: (context) =>
                    SongViewModel(songsRepository: context.read()),
                child: SongScreen(song: song),
              );
            case '/settings':
              return ChangeNotifierProvider(
                create: (context) =>
                    SettingsViewModel(settingsRepository: context.read()),
                child: SettingsScreen(),
              );
          }
          return const SizedBox.shrink();
        });
      },
    );
  }
}
