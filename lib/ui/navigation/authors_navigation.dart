import 'package:flutter/material.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/screens/authors/authors_view_model.dart';
import 'package:pisni/ui/screens/authors/authors_screen.dart';
import 'package:pisni/ui/screens/song/song_screen.dart';
import 'package:pisni/ui/screens/song/song_view_model.dart';
import 'package:pisni/ui/screens/songs/songs_screen.dart';
import 'package:pisni/ui/screens/songs/songs_view_model.dart';
import 'package:provider/provider.dart';

class AuthorsNavigation extends StatefulWidget {
  final Key navigatorKey;
  const AuthorsNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() => _AuthorsNavigationState();
}

class _AuthorsNavigationState extends State<AuthorsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: widget.navigatorKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            switch (settings.name) {
              case '/':
                return ChangeNotifierProvider(
                  create: (context) =>
                      AuthorsViewModel(songsRepository: context.read()),
                  child: AuthorsScreen(),
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
        });
  }
}
