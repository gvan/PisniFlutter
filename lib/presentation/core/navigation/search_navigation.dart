import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/di/service_locator.dart';
import 'package:pisni/domain/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/search/search_screen.dart';
import 'package:pisni/presentation/screens/search/search_cubit.dart';
import 'package:pisni/presentation/screens/song/song_screen.dart';
import 'package:pisni/presentation/screens/song/song_cubit.dart';

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
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case '/':
                return BlocProvider(
                  create: (context) => SearchCubit(findSongUseCase: sl()),
                  child: SearchScreen(),
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
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
