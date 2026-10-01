import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/core/di/service_locator.dart';
import 'package:pisni/features/songs/domain/entities/category_entity.dart';
import 'package:pisni/features/songs/domain/entities/song_entity.dart';
import 'package:pisni/features/songs/presentation/home/cubit/home_cubit.dart';
import 'package:pisni/features/songs/presentation/home/screen/home_screen.dart';
import 'package:pisni/features/songs/presentation/song/screen/song_screen.dart';
import 'package:pisni/features/songs/presentation/song/cubit/song_cubit.dart';
import 'package:pisni/features/songs/presentation/songs/screen/songs_screen.dart';
import 'package:pisni/features/songs/presentation/songs/cubit/songs_cubit.dart';

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
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case '/':
                return BlocProvider(
                  create: (context) =>
                      HomeCubit(watchCategoriesWithSongsUseCase: sl()),
                  child: HomeWidget(),
                );
              case '/songs':
                final category = settings.arguments as CategoryEntity;
                return BlocProvider(
                  create: (context) =>
                      SongsCubit(getSongsUseCase: sl(), category: category),
                  child: SongsScreen(category: category),
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
