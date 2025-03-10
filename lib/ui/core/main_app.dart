import 'package:flutter/material.dart';
import 'package:pisni/data/repository/i_songs_repository.dart';
import 'package:pisni/data/repository/songs_repository.dart';
import 'package:pisni/data/service/i_songs_service.dart';
import 'package:pisni/data/service/songs_service.dart';
import 'package:pisni/ui/core/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => SongsService() as ISongsService),
          Provider(
              create: (context) => SongsRepository(songsService: context.read())
                  as ISongsRepository),
        ],
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: BottomNavigation(),
        ));
  }
}
