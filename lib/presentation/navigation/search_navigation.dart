import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/presentation/screens/search/search_screen.dart';
import 'package:pisni/presentation/screens/search/search_view_model.dart';
import 'package:pisni/presentation/screens/song/song_screen.dart';
import 'package:pisni/presentation/screens/song/song_view_model.dart';
import 'package:provider/provider.dart';

class SearchNavigation extends StatefulWidget {
  final Key navigatorKey;

  const SearchNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() {
    return _SearchNavigationState();
  }
}

class _SearchNavigationState extends State<SearchNavigation> {
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
                    SearchViewModel(songsRepository: context.read()),
                child: SearchScreen(),
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
