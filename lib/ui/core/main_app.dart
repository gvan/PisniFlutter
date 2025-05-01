import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/data/repository/songs_repository.dart';
import 'package:pisni/data/service/favorite/favorite_service.dart';
import 'package:pisni/data/service/favorite/i_favorite_service.dart';
import 'package:pisni/data/service/songs/i_songs_service.dart';
import 'package:pisni/data/service/songs/songs_service.dart';
import 'package:pisni/ui/favorite/favorite_view_model.dart';
import 'package:pisni/ui/navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => SongsService() as ISongsService),
          Provider(create: (context) => FavoriteService() as IFavoriteService),
          Provider(
              create: (context) => SongsRepository(
                  songsService: context.read(),
                  favoriteService: context.read()) as ISongsRepository),
          ChangeNotifierProvider(
              create: (context) =>
                  FavoriteViewModel(songsRepository: context.read()))
        ],
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: BottomNavigation(),
        ));
  }
}
