import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/favorite/favorite_screen.dart';
import 'package:pisni/ui/song/song_screen.dart';
import 'package:pisni/ui/song/song_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteNavigation extends StatefulWidget {
  final Key navigatorKey;

  const FavoriteNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteNavigationState();
  }
}

class _FavoriteNavigationState extends State<FavoriteNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return FavoriteScreen();
            case '/song':
              final song = settings.arguments as Song;
              return ChangeNotifierProvider(
                create: (context) => SongViewModel(),
                child: SongScreen(song: song),
              );
          }
          return const SizedBox.shrink();
        });
      },
    );
  }
}
