import 'package:flutter/material.dart';
import 'package:pisni/ui/home/home_view_model.dart';
import 'package:pisni/ui/home/home_screen.dart';
import 'package:pisni/ui/songs/songs_screen.dart';
import 'package:provider/provider.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationState();
  }
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(Object context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return HomeWidget(
                  viewModel: HomeViewModel(songsRepository: context.read()));
            case '/songs':
              return SongsScreen();
          }
          return const SizedBox.shrink();
        });
      },
    );
  }
}
