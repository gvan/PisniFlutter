import 'package:flutter/material.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/screens/home/home_view_model.dart';
import 'package:pisni/ui/screens/home/home_screen.dart';
import 'package:pisni/ui/screens/song/song_screen.dart';
import 'package:pisni/ui/screens/song/song_view_model.dart';
import 'package:pisni/ui/screens/songs/songs_screen.dart';
import 'package:pisni/ui/screens/songs/songs_view_model.dart';
import 'package:provider/provider.dart';

class HomeNavigation extends StatefulWidget {
  final Key navigatorKey;

  const HomeNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationState();
  }
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(Object context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return ChangeNotifierProvider(
                create: (context) =>
                    HomeViewModel(songsRepository: context.read()),
                child: HomeWidget(),
              );
            case '/songs':
              final category = settings.arguments as Category;
              return ChangeNotifierProvider(
                create: (context) => SongsViewModel(
                    songsRepository: context.read(), category: category),
                child: SongsScreen(category: category),
              );
            case '/song':
              final song = settings.arguments as Song;
              return ChangeNotifierProvider(
                create: (context) =>
                    SongViewModel(songsRepository: context.read()),
                child: SongScreen(song: song),
              );
          }
          return const SizedBox.shrink();
        });
      },
    );
  }
}
